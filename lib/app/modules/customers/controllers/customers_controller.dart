import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/data/repository/customer/customer_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomersController extends GetxController {
  CustomersController({required this.customerRepo});
  final CustomerRepository customerRepo;

  RefreshController refreshController = RefreshController();

  final PagingController<int, Customer> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      print('Getting data');
      _fetchPage(pageKey);
    });
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
    try {
      final customersRes = await customerRepo.retrieveCustomers(queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        'expand': 'orders',
      });
      final isLastPage = customersRes!.customers!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(customersRes.customers!);
      } else {
        final nextPageKey = pageKey + customersRes.customers!.length;
        pagingController.appendPage(customersRes.customers!, nextPageKey);
      }
      refreshController.refreshCompleted();
    } catch (error) {
      pagingController.error = 'Error loading orders';
      refreshController.refreshFailed();
    }
  }
}
