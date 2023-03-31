import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/draft_order.dart';
import 'package:medusa_admin/app/data/repository/draft_order/draft_order_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DraftOrdersController extends GetxController {
  static DraftOrdersController instance = Get.find<DraftOrdersController>();
  DraftOrdersController({required this.draftOrderRepo});
  final DraftOrderRepo draftOrderRepo;
  final int _pageSize = 20;
  RxInt draftOrdersCount = 0.obs;
  RefreshController refreshController = RefreshController();
  final PagingController<int, DraftOrder> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await draftOrderRepo.retrieveDraftOrders(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      // 'expand': 'cart,order',
    });
    result.when((success) {
      final isLastPage = success.draftOrders!.length < _pageSize;
      draftOrdersCount.value = success.count ?? 0;
      if (isLastPage) {
        pagingController.appendLastPage(success.draftOrders!);
      } else {
        final nextPageKey = pageKey + success.draftOrders!.length;
        pagingController.appendPage(success.draftOrders!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = 'Error loading orders';
      refreshController.refreshFailed();
    });
  }
}
