import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';
import 'package:medusa_admin/app/data/repository/tax_rate/tax_rate_repo.dart';

class TaxSettingsController extends GetxController {
  TaxSettingsController({required this.taxRateRepo, required this.storeRepo});
  final TaxRateRepo taxRateRepo;
  final StoreRepo storeRepo;
  final pagingController = PagingController<int, TaxRate>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  bool automaticTaxes = false;
  bool giftCardsTaxable = false;
  TaxProvider? selectedTaxProvider;
  Region region = Get.arguments;
  List<TaxProvider>? taxProviders;
  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    automaticTaxes = region.automaticTaxes ?? false;
    giftCardsTaxable = region.giftCardsTaxable ?? false;
    update();
    await loadTaxProviders();
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await taxRateRepo.retrieveTaxRates(
      queryParams: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        'region_id': region.id!,
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

  Future<void> loadTaxProviders() async {
    final result = await storeRepo.retrieveTaxProviders();
    result.when((success) {
      if (success.taxProviders?.isNotEmpty ?? false) {
        taxProviders = success.taxProviders;
        update();
      } else {
        taxProviders = [TaxProvider(id: 'System Tax Provider')];
        selectedTaxProvider = taxProviders!.first;
        Get.snackbar('Error loading tax providers', 'Received tax providers are empty',
            snackPosition: SnackPosition.BOTTOM);
        update();
      }
    }, (error) {
      Get.back();
      Get.snackbar('Error loading tax providers ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  bool same() {
    if(automaticTaxes == region.automaticTaxes && giftCardsTaxable == region.giftCardsTaxable){
      return true;
    }
    return false;
  }
}
