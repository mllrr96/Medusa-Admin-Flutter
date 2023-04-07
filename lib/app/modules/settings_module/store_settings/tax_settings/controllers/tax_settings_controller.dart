import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/tax_rate/tax_rate_repo.dart';

class TaxSettingsController extends GetxController {
  TaxSettingsController({required this.taxRateRepo});
  final TaxRateRepo taxRateRepo;
  final pagingController = PagingController<int, TaxRate>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  String id = Get.arguments;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await taxRateRepo.retrieveTaxRates(
      queryParams: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        'region_id': id,
      },
    );

    result.when((success) {
      final isLastPage = success.taxRates!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.taxRates!);
      } else {
        final nextPageKey = pageKey + success.taxRates!.length;
        pagingController.appendPage(success.taxRates!, nextPageKey);
      }
    }, (error) {
      pagingController.error = error.message;
    });
  }
}
