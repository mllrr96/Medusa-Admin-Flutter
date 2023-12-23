import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PricingController extends GetxController {
  static PricingController get instance => Get.find<PricingController>();
  PricingController({required this.priceListRepo});
  final PriceListRepo priceListRepo;

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
    if(_refreshingData){
      return;
    }
    final result = await priceListRepo.retrievePriceLists(queryParameters: {
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
    final result = await priceListRepo.retrievePriceLists(queryParameters: {
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
        pagingController.appendPage(success.priceLists!, success.priceLists!.length);
      }
      refreshController.refreshCompleted();
    }, (_) {
      refreshController.refreshFailed();
      Fluttertoast.showToast(msg: 'Error refreshing data');
    });
    _refreshingData = true;
  }
}
