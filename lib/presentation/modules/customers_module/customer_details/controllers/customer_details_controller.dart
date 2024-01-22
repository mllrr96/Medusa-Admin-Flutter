import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/domain/use_case/customer/customer_use_case.dart';
import 'package:medusa_admin/domain/use_case/order/orders_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class CustomerDetailsController extends GetxController
    with StateMixin<Customer> {
  CustomerDetailsController(
      {required this.customerUseCase,
      required this.ordersUseCase,
      required this.customerId});
  final CustomerUseCase customerUseCase;
  final OrdersUseCase ordersUseCase;
  final PagingController<int, Order> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  RxInt ordersCount = 0.obs;
  final String customerId;
  @override
  Future<void> onInit() async {
    await loadCustomer();
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  Future<void> loadCustomer() async {
    change(null, status: RxStatus.loading());
    final result =
        await customerUseCase.retrieve(id: customerId, queryParameters: {
      'expand': 'shipping_addresses,groups,billing_address',
    });
    result.when(
        (customer) => change(customer, status: RxStatus.success()),
        (error) => change(null, status: RxStatus.error()));
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await ordersUseCase.retrieveOrders(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand': 'items,cart,customer,shipping_address,sales_channel,currency',
      'fields':
          'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer',
      'customer_id': customerId,
    });
    result.when((success) {
      final isLastPage = success.orders!.length < _pageSize;
      ordersCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.orders!);
      } else {
        final nextPageKey = pageKey + success.orders!.length;
        pagingController.appendPage(success.orders!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error;
    });
  }

  Future<void> refreshView() async {
    await loadCustomer();
    pagingController.refresh();
  }
}
