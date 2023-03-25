import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrdersController extends GetxController {
  OrdersController({required this.ordersRepository});
  OrdersRepository ordersRepository;
  RefreshController refreshController = RefreshController();
  RxInt ordersCount = 0.obs;

  final PagingController<int, Order> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await ordersRepository.retrieveOrders(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand': 'items,cart,customer,shipping_address,sales_channel,currency',
      'fields': 'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer',
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
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = 'Error loading orders';
      refreshController.refreshFailed();
    });
  }
}
