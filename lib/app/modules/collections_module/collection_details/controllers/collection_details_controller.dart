import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_post_collection_remove_products_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../collections/controllers/collections_controller.dart';

class CollectionDetailsController extends GetxController with StateMixin<ProductCollection> {
  CollectionDetailsController({required this.collectionRepo});
  CollectionRepo collectionRepo;
  String id = Get.arguments;
  @override
  Future<void> onInit() async {
    await loadCollection();
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

  Future<void> loadCollection() async {
    change(null, status: RxStatus.loading());
    final result = await collectionRepo.retrieve(id: id, queryParameters: {'expand': 'products'});
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
    final result = await collectionRepo.delete(id: id);
    result.when((success) {
      if(success.deleted!=null && success.deleted!){
        EasyLoading.showSuccess('Collection deleted');
        Get.back();
        CollectionsController.instance.pagingController.refresh();
      }else {
        EasyLoading.showError('Error deleting collection');
      }
    }, (error) {
      EasyLoading.showError('Error deleting collection');
      debugPrint(error.toString());
    });
  }

  Future<void> removeProduct(String productId) async {
    loading();
    final result = await collectionRepo.removeProducts(
        userCollectionRemoveProductsReq: UserCollectionRemoveProductsReq(collectionId: id, productsIds: [productId]));

    result.when((success) async {
      EasyLoading.showSuccess('Product removed');
      await loadCollection();
      CollectionsController.instance.pagingController.refresh();
    }, (error) {
      EasyLoading.showError('Error removing product');
      debugPrint(error.toString());
    });
  }
}
