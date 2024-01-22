import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/use_case/collection/collections_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CollectionsController extends GetxController {
  static CollectionsController get instance =>
      Get.find<CollectionsController>();
  CollectionsController({required this.collectionsUseCase});
  final CollectionsUseCase collectionsUseCase;
  RxInt collectionCount = 0.obs;
  RefreshController refreshController = RefreshController();

  final PagingController<int, ProductCollection> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final scrollController = ScrollController();
  bool _refreshingData = false;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    if (_refreshingData) {
      return;
    }
    final result = await collectionsUseCase.fetchCollections(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
    });
    result.when((success) {
      final isLastPage = success.collections!.length < _pageSize;
      collectionCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.collections!);
      } else {
        final nextPageKey = pageKey + success.collections!.length;
        pagingController.appendPage(success.collections!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      refreshController.refreshFailed();
      pagingController.error = error;
    });
  }

  Future<void> refreshData() async {
    _refreshingData = true;
    final result = await collectionsUseCase.fetchCollections(queryParameters: {
      'offset': 0,
      'limit': _pageSize,
    });
    await result.when((success) async {
      final isLastPage = success.collections!.length < _pageSize;
      collectionCount.value = success.count ?? 0;
      pagingController.value = const PagingState(
        nextPageKey: null,
        error: null,
        itemList: null,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      if (isLastPage) {
        pagingController.appendLastPage(success.collections!);
      } else {
        pagingController.appendPage(
            success.collections!, success.collections!.length);
      }
      refreshController.refreshCompleted();
    }, (error) async {
      refreshController.refreshFailed();
      Fluttertoast.showToast(msg: "Error refreshing data");
      if (error.code == 401) {
        await getIt<AppRouter>().reevaluateGuards();
      }
    });
    _refreshingData = false;
  }
}
