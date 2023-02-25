import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_post_collection_remove_products_req.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/modules/collections/controllers/collections_controller.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

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
    result.fold((l) {
      if (l.collection != null) {
        change(l.collection!, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error('Error loading collection'));
      }
    }, (r) {
      change(null, status: RxStatus.error('Error loading collection'));
      debugPrint(r.toString());
    });
  }

  Future<void> deleteCollection() async {
    loading();
    final result = await collectionRepo.delete(id: id);
    result.fold((l) {
      EasyLoading.showSuccess('Collection deleted');
      Get.back();
      CollectionsController.instance.pagingController.refresh();
    }, (r) {
      EasyLoading.showError('Error deleting collection');
      debugPrint(r.toString());
    });
  }

  Future<void> removeProduct(String productId) async {
    loading();
    final result = await collectionRepo.removeProducts(
        userCollectionRemoveProductsReq: UserCollectionRemoveProductsReq(collectionId: id, productsIds: [productId]));
    result.fold((l) async {
      EasyLoading.showSuccess('Product removed');
      await loadCollection();
      CollectionsController.instance.pagingController.refresh();
    }, (r) {
      EasyLoading.showError('Error removing product');
      debugPrint(r.toString());
    });
  }
}
