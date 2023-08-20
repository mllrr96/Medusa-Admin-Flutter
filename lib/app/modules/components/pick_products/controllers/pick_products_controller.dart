import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../data/models/store/product.dart';
import '../../../../data/repository/product/products_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class PickProductsController extends GetxController {
  PickProductsController({required this.productsRepo, this.pickProductsReq});
  final ProductsRepo productsRepo;
  final PickProductsReq? pickProductsReq;
  final int _pageSize = 20;
  final PagingController<int, Product> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  List<Product> selectedProducts = [];
  Function eq = const SetEquality().equals;
  // bool get isEqual => eq(productsIds.toSet(), originalProductsIds.toSet());
  late PickProductsReq productsReq;

  @override
  void onInit() {
    productsReq = Get.arguments ?? pickProductsReq ?? PickProductsReq();
    pagingController.addPageRequestListener((pageKey) => _fetchPage(pageKey));
    selectedProducts.addAllIf(productsReq.selectedProducts != null, productsReq.selectedProducts ?? []);
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    final result = await productsRepo.retrieveAll(
      queryParameters: {
        'fields': 'id,title,thumbnail,status,handle,collection_id',
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
      },
    );

    result.when((success) {
      final isLastPage = success.products!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(success.products!);
      } else {
        final nextPageKey = pageKey + success.products!.length;
        pagingController.appendPage(success.products!, nextPageKey);
      }
    }, (error) => pagingController.error = error.message);
  }

  Future<void> save() async {
    List<Product> removedProducts = [];
    removedProducts.addAllIf(productsReq.selectedProducts != null, productsReq.selectedProducts ?? []);
    removedProducts.removeWhere((e) => selectedProducts.map((e) => e.id).contains(e.id));
    Get.back(
      result: PickProductsRes(
        selectedProducts: selectedProducts,
        deSelectedProducts: removedProducts,
      ),
    );
  }
}

class PickProductsReq {
  PickProductsReq({
    this.selectedProducts,
    this.disabledProducts,
    this.includeVariantCount = false,
  });
  final List<Product>? selectedProducts;
  final List<Product>? disabledProducts;
  final bool includeVariantCount;
}

class PickProductsRes {
  PickProductsRes({required this.selectedProducts, required this.deSelectedProducts});
  final List<Product> selectedProducts;
  final List<Product> deSelectedProducts;
}
