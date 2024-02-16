import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:medusa_admin/domain/use_case/product/product_variants_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class PickProductVariantsController extends GetxController {
  PickProductVariantsController({required this.productVariantsUseCase, required this.selectProductsReq});
  ProductVariantsUseCase productVariantsUseCase;
  final int _pageSize = 12;
  final PagingController<int, ProductVariant> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 4);
  final SelectProductsReq selectProductsReq;
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
    final result = await productVariantsUseCase(
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
    }, (error) => pagingController.error = error);
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
