// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:medusa_admin/core/error/failure.dart';
//
// import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
// import 'package:medusa_admin/core/di/di.dart';
// import 'package:medusa_admin/domain/use_case/product/products_use_case.dart';
// import 'package:medusa_admin/core/route/app_router.dart';
// import 'package:medusa_admin_flutter/medusa_admin.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// class GiftCardsController extends GetxController {
//   static GiftCardsController get instance => Get.find<GiftCardsController>();
//
//   GiftCardsController({required this.productsUseCase});
//   final ProductsUseCase productsUseCase;
//   final pagingController = PagingController<int, Product>(
//       firstPageKey: 0, invisibleItemsThreshold: 6);
//   final int _pageSize = 20;
//   final scrollController = ScrollController();
//   final refreshController = RefreshController();
//   RxInt giftCardsCount = 0.obs;
//   bool _refreshingData = false;
//   @override
//   void onInit() {
//     pagingController
//         .addPageRequestListener((pageKey) => _fetchProductGiftCards(pageKey));
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     scrollController.dispose();
//     refreshController.dispose();
//     pagingController.dispose();
//     super.onClose();
//   }
//
//   Future<void> _fetchProductGiftCards(int pageKey) async {
//     if (_refreshingData) {
//       return;
//     }
//     final result = await productsUseCase.fetchProducts(queryParameters: {
//       'is_giftcard': true,
//       'offset': pagingController.itemList?.length ?? 0,
//       'limit': _pageSize,
//     });
//     result.when((success) {
//       if (success.products == null) {
//         pagingController.error = Failure(
//             message: 'Error loading gift cards, received null value',
//             type: 'null_value');
//         return;
//       }
//       final isLastPage = success.products!.length < _pageSize;
//       giftCardsCount.value = success.count ?? 0;
//       if (isLastPage) {
//         pagingController.appendLastPage(success.products!);
//       } else {
//         final nextPageKey = pageKey + success.products!.length;
//         pagingController.appendPage(success.products!, nextPageKey);
//       }
//       refreshController.refreshCompleted();
//     }, (error) {
//       pagingController.error = error;
//       refreshController.refreshFailed();
//     });
//   }
//
//   Future<void> refreshData() async {
//     _refreshingData = true;
//     final result = await productsUseCase.fetchProducts(queryParameters: {
//       'is_giftcard': true,
//       'offset': 0,
//       'limit': _pageSize,
//     });
//     await result.when((success) async {
//       if (success.products == null) {
//         pagingController.error = Failure(
//             message: 'Error loading gift cards, received null value',
//             type: 'null_value');
//         return;
//       }
//       final isLastPage = success.products!.length < _pageSize;
//       giftCardsCount.value = success.count ?? 0;
//       pagingController.value = const PagingState(
//         nextPageKey: null,
//         error: null,
//         itemList: null,
//       );
//       await Future.delayed(const Duration(milliseconds: 300));
//       if (isLastPage) {
//         pagingController.appendLastPage(success.products!);
//       } else {
//         pagingController.appendPage(
//             success.products!, success.products!.length);
//       }
//       refreshController.refreshCompleted();
//     }, (error) async {
//       refreshController.refreshFailed();
//       Fluttertoast.showToast(msg: 'Error refreshing data');
//       if (error.code == 401) {
//         await getIt<AppRouter>().reevaluateGuards();
//       }
//     });
//     _refreshingData = false;
//   }
//
//   Future<void> deleteProduct(String id) async {
//     loading();
//     final result = await productsUseCase.delete(id: id);
//     result.when((success) {
//       EasyLoading.showSuccess('Gift card deleted');
//       pagingController.refresh();
//       return;
//     }, (error) {
//       Get.snackbar(
//           'Error deleting gift card ${error.code ?? ''}', error.message,
//           snackPosition: SnackPosition.BOTTOM);
//     });
//     dismissLoading();
//   }
//
//   Future<void> toggleProduct(Product product) async {
//     loading();
//     final result = await productsUseCase.update(
//         userPostUpdateProductReq: UserPostUpdateProductReq(
//             status: product.status == ProductStatus.published
//                 ? ProductStatus.draft
//                 : ProductStatus.published),
//         id: product.id!);
//     result.when((success) {
//       EasyLoading.showSuccess('Gift card updated');
//       pagingController.refresh();
//       return;
//     }, (error) {
//       Get.snackbar(
//           'Error updating gift card ${error.code ?? ''}', error.message,
//           snackPosition: SnackPosition.BOTTOM);
//     });
//     dismissLoading();
//   }
// }
