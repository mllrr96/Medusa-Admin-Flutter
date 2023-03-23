import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_create_collection_req.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../data/models/store/product_collection.dart';
import '../../collections/controllers/collections_controller.dart';

class CreateCollectionController extends GetxController {
  CreateCollectionController({required this.collectionRepo});
  CollectionRepo collectionRepo;
  final titleCtrl = TextEditingController();
  final handleCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool updateCollection = false;
  ProductCollection? collection;
  Map<String, dynamic> metadata = {};
  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is List && (Get.arguments as List).length == 2) {
      collection = Get.arguments[0];
      updateCollection = Get.arguments[1];
      titleCtrl.text = collection!.title!;
      handleCtrl.text = collection!.handle ?? '';
      metadata = collection!.metadata;
    }

    super.onInit();
  }


  @override
  void onClose() {
    titleCtrl.dispose();
    handleCtrl.dispose();
    super.onClose();
  }

  Future<void> publish() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    loading();
    final result = await collectionRepo.create(
        userCreateCollectionReq: UserCreateCollectionReq(
            title: titleCtrl.text, handle: handleCtrl.text.removeAllWhitespace.isEmpty ? null : handleCtrl.text));
    result.when((success) {
      EasyLoading.showSuccess('Collection Created');
      CollectionsController.instance.pagingController.refresh();
      Get.back();
    }, (error) {
      EasyLoading.showError('Error creating collection');
      debugPrint(error.toString());
    });
  }

  Future<void> edit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (titleCtrl.text == collection!.title &&
        handleCtrl.text == collection!.handle &&
        metadata == collection!.metadata) {
      Get.back();
      return;
    }

    loading();
    final result = await collectionRepo.update(
        id: collection!.id!,
        userCreateCollectionReq: UserCreateCollectionReq(
            title: titleCtrl.text, handle: handleCtrl.text.removeAllWhitespace.isEmpty ? null : handleCtrl.text));
    result.when((success) {
      EasyLoading.showSuccess('Collection updated');
      CollectionsController.instance.pagingController.refresh();
      Get.back(result: true);
    }, (error) {
      EasyLoading.showError('Error updating collection');
      debugPrint(error.toString());
    });
  }
}
