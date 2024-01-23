import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/use_case/file/get_file_url_use_case.dart';
import 'package:medusa_admin/domain/use_case/order/retrieve_exported_orders_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';

class ActivityController extends GetxController {
  static ActivityController get instance => Get.find<ActivityController>();
  static void get reload => instance.pagingController.refresh();
  final pagingController = PagingController<int, BatchJob>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final refreshController = RefreshController();
  late Dio dio;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    dio = getIt<Dio>();
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result =
        await RetrieveExportedOrdersUseCase.instance(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
    });
    result.when((batchJobs) {
      final isLastPage = batchJobs.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(batchJobs);
      } else {
        final nextPageKey = pageKey + batchJobs.length;
        pagingController.appendPage(batchJobs, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      refreshController.refreshFailed();
      pagingController.error = error;
    });
  }

  Future<void> shareFile(String? fileKey) async {
    if (fileKey == null) {
      return;
    }
    final fileName = fileKey.split('/').last;
    Directory dir = await getApplicationDocumentsDirectory();
    String savePath = '${dir.path}/exports/$fileName';

    final exist = await File(savePath).exists();
    if (exist) {
      await Share.shareXFiles([XFile(savePath)]);
    } else {
      final result = await GetFileUrlUseCase.instance(fileKey);
      await result.when((uri) async {
        final file = await _downloadFile(uri, fileName);
        if (file != null) {
          await Share.shareXFiles([XFile(file.path)]);
        }
      }, (error) => null);
    }
  }

  Future<File?> _downloadFile(String uri, String fileName) async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      String savePath = '${dir.path}/exports/$fileName';

      await dio.download(
        uri,
        savePath,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              if (status != null) {
                return status < 500;
              } else {
                return false;
              }
            }),
      );

      File file = File(savePath);

      return file;
    } catch (e) {
      return null;
    }
  }
}
