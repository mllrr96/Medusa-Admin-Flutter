import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

class MedusaSearchController extends GetxController {
  static MedusaSearchController get instance =>
      Get.find<MedusaSearchController>();
  MedusaSearchController({required this.productsRepo});

  final ProductsRepo productsRepo;

  final PagingController<int, Object> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  TextEditingController searchCtrl = TextEditingController();

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      print(pageKey);
      fetchPage(pageKey);
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

  Future<void> fetchPage(int pageKey) async {
    if (searchCtrl.text.removeAllWhitespace.isEmpty) {
      pagingController.itemList = [];
      return;
    }


    final result = await productsRepo.retrieveAll(queryParams: {
      'offset': pagingController.itemList?.length ?? 0,
      'limit': _pageSize,
      'q': searchCtrl.text
    });
    result.when((success) {
      final isLastPage = success.products!.length < _pageSize;
      print(isLastPage);
      if (isLastPage) {
        pagingController.appendLastPage(success.products!);
      } else {
        final nextPageKey = pageKey + success.products!.length;
        pagingController.appendPage(success.products!, nextPageKey);
      }

      print(success.products?.length);
    }, (error) {
      pagingController.error = 'Error searching';
    });
  }
}

class SearchReq {
  SearchableFields searchableFields;

  SearchReq({
    required this.searchableFields,
  });
}

enum SearchableFields {
  orders,
  draftOrders,
  products,
  collections,
  customers,
  groups,
  giftCards,
  discounts,
  priceLists
}
