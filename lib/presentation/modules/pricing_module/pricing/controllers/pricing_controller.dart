import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/domain/use_case/price_lists_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class PricingController extends GetxController {
  static PricingController get instance => Get.find<PricingController>();
  PricingController({required this.priceListsUseCase});
  final PriceListsUseCase priceListsUseCase;

  final pagingController = PagingController<int, PriceList>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final refreshController = RefreshController();
  final scrollController = ScrollController();
  bool _refreshingData = false;
  RxInt priceListsCount = 0.obs;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    if (_refreshingData) {
      return;
    }
    final result = await priceListsUseCase(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand': 'customer_groups,prices'
    });
    result.when((success) {
      final isLastPage = success.priceLists!.length < _pageSize;
      priceListsCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.priceLists!);
      } else {
        final nextPageKey = pageKey + success.priceLists!.length;
        pagingController.appendPage(success.priceLists!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = error;
      refreshController.refreshFailed();
    });
  }

  Future<void> refreshData() async {
    _refreshingData = true;
    final result = await priceListsUseCase(queryParameters: {
      'offset': 0,
      'limit': _pageSize,
      'expand': 'customer_groups,prices'
    });

    await result.when((success) async {
      final isLastPage = success.priceLists!.length < _pageSize;
      priceListsCount.value = success.count ?? 0;
      pagingController.value = const PagingState(
        nextPageKey: null,
        error: null,
        itemList: null,
      );
      await Future.delayed(const Duration(milliseconds: 300));
      if (isLastPage) {
        pagingController.appendLastPage(success.priceLists!);
      } else {
        pagingController.appendPage(
            success.priceLists!, success.priceLists!.length);
      }
      refreshController.refreshCompleted();
    }, (error) async {
      refreshController.refreshFailed();
      Fluttertoast.showToast(msg: 'Error refreshing data');
      if (error.code == 401) {
        await getIt<AppRouter>().reevaluateGuards();
      }
    });
    _refreshingData = true;
  }
}
