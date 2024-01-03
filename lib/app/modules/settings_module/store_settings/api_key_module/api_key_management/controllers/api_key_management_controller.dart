import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/api_key_use_case.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';


class ApiKeyManagementController extends GetxController {
  ApiKeyManagementController({required this.apiKeyUseCase});
  final ApiKeyUseCase apiKeyUseCase;
  static ApiKeyManagementController get instance => Get.find<ApiKeyManagementController>();

  final pagingController = PagingController<int, PublishableApiKey>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final refreshController = RefreshController();

  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> _fetchPage(int pageKey) async {
    final result = await apiKeyUseCase.fetchApiKeys(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
    });

    result.when((success) {
      final isLastPage = success.keys!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.keys!);
      } else {
        final nextPageKey = pageKey + success.keys!.length;
        pagingController.appendPage(success.keys!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = 'Error loading Api keys';
      refreshController.refreshFailed();
    });
  }
}
