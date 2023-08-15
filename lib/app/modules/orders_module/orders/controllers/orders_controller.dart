import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/orders_filter_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrdersController extends GetxController with GetSingleTickerProviderStateMixin {
  static OrdersController get instance => Get.find<OrdersController>();

  OrdersController({required this.ordersRepository, required this.regionsRepo, required this.salesChannelRepo});
  OrdersRepo ordersRepository;
  RegionsRepo regionsRepo;
  SalesChannelRepo salesChannelRepo;
  final refreshController = RefreshController();
  RxInt ordersCount = 0.obs;
  late TabController tabController;
  RxString searchTerm = ''.obs;
  late Worker searchDebouncer;
  final scrollController = ScrollController();
  final pagingController = PagingController<int, Order>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  OrderFilter? orderFilter;
  List<Region>? regions;
  List<SalesChannel>? salesChannels;

  @override
  void onInit() {
    searchDebouncer =
        debounce(searchTerm, (callback) => pagingController.refresh(), time: const Duration(milliseconds: 300));
    tabController = TabController(length: 2, vsync: this);
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await loadRegions();
    await loadSalesChannels();

    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await ordersRepository.retrieveOrders(
        queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      if (searchTerm.value.removeAllWhitespace.isNotEmpty) 'q': searchTerm.value,
      'expand': 'items,cart,customer,shipping_address,sales_channel,currency',
      'fields': 'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer',
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
      pagingController.error = 'Error loading orders';
      refreshController.refreshFailed();
    });
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

  loadRegions() async {
    final result = await regionsRepo.retrieveAll();
    result.when((success) {
      if (success.regions?.isNotEmpty ?? false) {
        regions = success.regions;
      } else {
        regions = [];
      }
    }, (error) {});
  }

  loadSalesChannels() async {
    final result = await salesChannelRepo.retrieveAll();
    result.when((success) {
      if (success.salesChannels?.isNotEmpty ?? false) {
        salesChannels = success.salesChannels;
      } else {
        salesChannels = [];
      }
    }, (error) {});
  }
}
