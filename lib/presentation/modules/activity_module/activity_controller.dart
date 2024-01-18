import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/domain/use_case/retrieve_exported_orders_use_case.dart';
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
    dio = Dio();
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result =
        await RetrieveExportedOrdersUseCase.instance(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      // // type[] is used due to an issue with dio and query parameters
      // // for more check https://github.com/cfug/dio/issues/315#issuecomment-1284983273
      // 'type[]': ['order-export']
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

  Future<void> shareFile(String uri, String fileName) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String savePath = '${dir.path}/exports/$fileName';
    final exist = await File(savePath).exists();
    if (exist) {
      await Share.shareXFiles([XFile(savePath)]);
    } else {
      await _downloadFile(uri, fileName).then((downloaded) async {
        if (downloaded) {
          await Share.shareXFiles([XFile(savePath)]);
        }
      });
    }
  }

  Future<bool> _downloadFile(String uri, String fileName) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String savePath = '${dir.path}/exports/$fileName';
    return await dio
        .download(
      '${AuthPreferenceService.baseUrl}/$uri',
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
      deleteOnError: true,
    )
        .then((_) async {
      Directory dir = await getApplicationDocumentsDirectory();
      String savePath = '${dir.path}/exports/$fileName';
      final exist = await File(savePath).exists();
      return exist;
    });
  }
}
