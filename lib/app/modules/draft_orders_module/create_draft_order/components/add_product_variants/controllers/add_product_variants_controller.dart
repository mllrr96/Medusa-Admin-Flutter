import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/product_variant/product_variant_repo.dart';
import 'package:collection/collection.dart';
import '../../../../../../data/models/store/product_variant.dart';

class AddProductVariantsController extends GetxController {
  AddProductVariantsController({required this.productVariantRepo});

  ProductVariantRepo productVariantRepo;
  final int _pageSize = 12;
  final PagingController<int, ProductVariant> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 4);
  SelectProductsReq selectProductsReq = Get.arguments ?? SelectProductsReq();
  final List<ProductVariant> newlySelectedProducts = [];
  // final List<String> originalProductsIds = [];
  Function eq = const SetEquality().equals;
  bool get isEqual => eq(newlySelectedProducts.map((e) => e.id).toList().toSet(),
      selectProductsReq.selectedProducts?.map((e) => e.id).toList().toSet());

  @override
  void onInit() {
    if (selectProductsReq.selectedProducts?.isNotEmpty ?? false) {
      newlySelectedProducts.addAll(selectProductsReq.selectedProducts!);
    }
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await productVariantRepo.retrieveProductVariants(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );

    result.when((success) {
      final isLastPage = success.variants!.length < _pageSize;

      if (isLastPage) {
        pagingController.appendLastPage(success.variants!);
      } else {
        final nextPageKey = pageKey + success.variants!.length;
        pagingController.appendPage(success.variants!, nextPageKey);
      }
    }, (error) => pagingController.error = error.message);
  }
}

class SelectProductsReq {
  final List<ProductVariant>? selectedProducts;
  final bool multipleSelect;
  SelectProductsReq({this.multipleSelect = true, this.selectedProducts});
}

class SelectProductsRes {
  final List<ProductVariant>? selectedProductVariants;
  SelectProductsRes({this.selectedProductVariants});
}
