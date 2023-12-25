import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:medusa_admin/app/data/repository/product_tag/product_tag_repo.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/orders_filter_controller.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/orders_filter_view.dart';
import 'package:medusa_admin/app/modules/products_module/products/components/products_filter_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find<OrdersController>();

  OrdersController({required this.ordersRepository});
  final OrdersRepo ordersRepository;
  final refreshController = RefreshController();
  RxInt ordersCount = 0.obs;
  final scrollController = ScrollController();
  final pagingController =
      PagingController<int, Order>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  OrderFilter? orderFilter;
  bool refreshingData = false;
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    Get.put(OrdersFilterController(
        regionsRepo: RegionsRepo(), salesChannelRepo: SalesChannelRepo()));
    Get.put(ProductsFilterController(productTagRepo: ProductTagRepo(), collectionRepo: CollectionRepo()));
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    if (refreshingData) {
      return;
    }
    final result = await ordersRepository.retrieveOrders(
        queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand': 'items,cart,customer,shipping_address,sales_channel,currency',
      'fields':
          'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer',
    }..addAll(orderFilter?.toJson() ?? {}));
    result.when((success) {
      final isLastPage = success.orders!.length < _pageSize;
      ordersCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.orders!);
      } else {
        final nextPageKey = pageKey + success.orders!.length;
        pagingController.appendPage(success.orders!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = error;
      refreshController.refreshFailed();
    });
  }

  Future<void> refreshData() async {
    refreshingData = true;
    final result = await ordersRepository.retrieveOrders(
        queryParameters: {
      'offset': 0,
      'limit': _pageSize,
      'expand': 'items,cart,customer,shipping_address,sales_channel,currency',
      'fields':
          'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer',
    }..addAll(orderFilter?.toJson() ?? {}));
    await result.when((success) async {
      final isLastPage = success.orders!.length < _pageSize;
      ordersCount.value = success.count ?? 0;
      pagingController.value =
          const PagingState(nextPageKey: null, error: null, itemList: null);
      await Future.delayed(const Duration(milliseconds: 300));
      if (isLastPage) {
        pagingController.appendLastPage(success.orders!);
      } else {
        pagingController.appendPage(success.orders!, success.orders!.length);
      }
      refreshController.refreshCompleted();
    }, (error) {
      refreshController.refreshFailed();
      Fluttertoast.showToast(msg: "Error refreshing data");
    });
    refreshingData = false;
  }

  void resetFilter() {
    if (orderFilter == null || orderFilter?.count() == 0) {
      return;
    }
    orderFilter = null;
    pagingController.refresh();
    update();
  }

  void updateFilter(OrderFilter orderFilter) {
    this.orderFilter = orderFilter;
    pagingController.refresh();
    update();
  }
}
