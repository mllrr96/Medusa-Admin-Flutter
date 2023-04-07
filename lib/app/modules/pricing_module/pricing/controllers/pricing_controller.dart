import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PricingController extends GetxController {
  PricingController({required this.priceListRepo});
  final PriceListRepo priceListRepo;

  final pagingController = PagingController<int, PriceList>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  final refreshController = RefreshController();

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await priceListRepo.retrievePriceLists(queryParameters: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'expand' :'customer_groups,prices'
    });
    result.when((success) {
      final isLastPage = success.priceLists!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.priceLists!);
      } else {
        final nextPageKey = pageKey + success.priceLists!.length;
        pagingController.appendPage(success.priceLists!, nextPageKey);
      }
      refreshController.refreshCompleted();
    }, (error) {
      pagingController.error = 'Error loading  price list \n ${error.message}';
      refreshController.refreshFailed();
    });
  }
}
