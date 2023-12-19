import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../data/models/req/user_collection_req.dart';
import '../../collections/controllers/collections_controller.dart';

class CollectionDetailsController extends GetxController with StateMixin<ProductCollection> {
  CollectionDetailsController({required this.collectionRepo, required this.collectionId});
  CollectionRepo collectionRepo;
 final String collectionId;
  @override
  Future<void> onInit() async {
    await loadCollection();
    super.onInit();
  }

  Future<void> loadCollection() async {
    change(null, status: RxStatus.loading());
    final result = await collectionRepo.retrieve(id: collectionId, queryParameters: {'expand': 'products'});
    result.when((success) {
      if (success.collection != null) {
        change(success.collection!, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error('Error loading collection'));
      }
    }, (error) {
      change(null, status: RxStatus.error('Error loading collection'));
      debugPrint(error.toString());
    });
  }

  Future<void> deleteCollection() async {
    loading();
    final result = await collectionRepo.delete(id: collectionId);
    result.when((success) {
      if (success.deleted != null && success.deleted!) {
        EasyLoading.showSuccess('Collection deleted');
        Get.back();
        CollectionsController.instance.pagingController.refresh();
      } else {
        EasyLoading.showError('Error deleting collection');
      }
    }, (error) {
      EasyLoading.showError('Error deleting collection');
      debugPrint(error.toString());
    });
  }

  Future<void> removeProducts(List<String> productIds) async {
    loading();
    final result = await collectionRepo.removeProducts(
        userCollectionRemoveProductsReq: UserCollectionRemoveProductsReq(collectionId: collectionId, productsIds: productIds));

    result.when((success) async {
      EasyLoading.showSuccess('Product removed');
      await loadCollection();
      CollectionsController.instance.pagingController.refresh();
    }, (error) {
      EasyLoading.showError('Error removing product');
      debugPrint(error.toString());
    });
  }

  Future<void> addProducts({required List<String> addedProducts, required List<String> removedProducts}) async {
    loading();
    if (addedProducts.isNotEmpty) {
      final result = await collectionRepo.updateProducts(
          userCollectionUpdateProductsReq:
              UserCollectionUpdateProductsReq(collectionId: collectionId, productsIds: addedProducts));
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
      final result = await collectionRepo.removeProducts(
          userCollectionRemoveProductsReq:
              UserCollectionRemoveProductsReq(collectionId: collectionId, productsIds: removedProducts));
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
    if(removedProducts.isNotEmpty && addedProducts.isNotEmpty){
      await loadCollection();
      CollectionsController.instance.pagingController.refresh();
      EasyLoading.showSuccess('Product updated');
    }

  }
}
