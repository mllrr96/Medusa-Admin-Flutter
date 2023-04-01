import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/data/repository/customer/customer_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomersController extends GetxController with GetSingleTickerProviderStateMixin {
  static CustomersController instance = Get.find<CustomersController>();
  CustomersController({required this.customerRepo});
  final CustomerRepo customerRepo;

  RefreshController refreshController = RefreshController();
  late TabController tabController;
  final PagingController<int, Customer> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  RxInt customersCount = 0.obs;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await customerRepo.retrieveCustomers(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand': 'orders',
    });
    result.when((success) {
      final isLastPage = success.customers!.length < _pageSize;
      customersCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.customers!);
      } else {
        final nextPageKey = pageKey + success.customers!.length;
        pagingController.appendPage(success.customers!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = 'Error loading orders \n ${error.message}';
      refreshController.refreshFailed();
    });
  }
}
