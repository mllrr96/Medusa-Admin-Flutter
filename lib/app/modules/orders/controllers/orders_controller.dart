import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/order/orders_repo.dart';

class OrdersController extends GetxController {
  OrdersController({required this.ordersRepository});
  OrdersRepository ordersRepository;

  final PagingController<int, Order> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final productRes = await ordersRepository.retrieveOrders(queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        'expand': 'items,cart'
      });
      final isLastPage = productRes!.orders!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(productRes.orders!);
      } else {
        final nextPageKey = pageKey + productRes.orders!.length;
        pagingController.appendPage(productRes.orders!, nextPageKey);
      }
    } catch (error) {
      pagingController.error = 'Error loading orders';
    }
  }
}
