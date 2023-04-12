import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../data/models/store/publishable_api_key.dart';
import '../../../../../../data/repository/publishable_api_key/publishable_api_key_repo.dart';

class ApiKeyManagementController extends GetxController {
  ApiKeyManagementController({required this.apiKeyRepo});
  final PublishableApiKeyRepo apiKeyRepo;

  final pagingController = PagingController<int, PublishableApiKey>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final refreshController = RefreshController();

  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await apiKeyRepo.retrievePublishableApiKeys(queryParameters: {
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
