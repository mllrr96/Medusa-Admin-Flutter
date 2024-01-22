import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/domain/use_case/collection/collection_details_use_case.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../collections/controllers/collections_controller.dart';

class CollectionDetailsController extends GetxController
    with StateMixin<ProductCollection> {
  CollectionDetailsController(
      {required this.collectionDetailsUseCase, required this.collectionId});
  CollectionDetailsUseCase collectionDetailsUseCase;
  final String collectionId;
  @override
  Future<void> onInit() async {
    await loadCollection();
    super.onInit();
  }

  Future<void> loadCollection() async {
    change(null, status: RxStatus.loading());
    final result = await collectionDetailsUseCase
        .getCollection(collectionId, queryParameters: {'expand': 'products'});
    result.when((collection) {
      change(collection, status: RxStatus.success());
    }, (error) {
      change(null,
          status:
              RxStatus.error('Error loading collection, ${error.toString()}'));
      debugPrint(error.toString());
    });
  }

  Future<void> deleteCollection(BuildContext context) async {
    loading();
    final result =
        await collectionDetailsUseCase.deleteCollection(collectionId);
    result.when((success) {
      if (success.deleted != null && success.deleted!) {
        context.showSnackBar('Collection deleted');
        context.popRoute();
        CollectionsController.instance.pagingController.refresh();
      } else {
        context.showSnackBar('Error deleting collection');
      }
    }, (error) {
      context.showSnackBar(
          'Error deleting collection, ${error.toSnackBarString()}');
    });
    dismissLoading();
  }

  Future<void> removeProducts(List<String> productIds) async {
    loading();
    final result = await collectionDetailsUseCase.removeProducts(
        UserCollectionRemoveProductsReq(
            collectionId: collectionId, productsIds: productIds));

    result.when((success) async {
      EasyLoading.showSuccess('Product removed');
      await loadCollection();
      CollectionsController.instance.pagingController.refresh();
    }, (error) {
      EasyLoading.showError('Error removing product');
      debugPrint(error.toString());
    });
  }

  Future<void> addProducts(
      {required List<String> addedProducts,
      required List<String> removedProducts}) async {
    loading();
    if (addedProducts.isNotEmpty) {
      final result = await collectionDetailsUseCase.updateProducts(
          UserCollectionUpdateProductsReq(
              collectionId: collectionId, productsIds: addedProducts));
      result.when((success) async {
        if (removedProducts.isEmpty) {
          await loadCollection();
          CollectionsController.instance.pagingController.refresh();
          EasyLoading.showSuccess('Product updated');
        }
      }, (error) {
        EasyLoading.showError('Error updating product');
        debugPrint(error.toString());
        return;
      });
    }
    if (removedProducts.isNotEmpty) {
      final result = await collectionDetailsUseCase.removeProducts(
          UserCollectionRemoveProductsReq(
              collectionId: collectionId, productsIds: removedProducts));
      result.when((success) async {
        if (addedProducts.isEmpty) {
          await loadCollection();
          CollectionsController.instance.pagingController.refresh();
          EasyLoading.showSuccess('Product updated');
        }
      }, (error) {
        EasyLoading.showError('Error updating product');
        debugPrint(error.toString());
        return;
      });
    }
    if (removedProducts.isNotEmpty && addedProducts.isNotEmpty) {
      await loadCollection();
      CollectionsController.instance.pagingController.refresh();
      EasyLoading.showSuccess('Product updated');
    }
  }
}
