import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/domain/use_case/collection/collection_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../../collections/controllers/collections_controller.dart';

class CreateCollectionController extends GetxController {
  CreateCollectionController(
      {required this.collectionUseCase, required this.updateCollectionReq});
  CollectionUseCase collectionUseCase;
  final titleCtrl = TextEditingController();
  final handleCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool updateCollection = false;
  ProductCollection? collection;
  final UpdateCollectionReq? updateCollectionReq;
  Map<String, dynamic> metadata = {};
  @override
  void onInit() {
    if (updateCollectionReq != null) {
      collection = updateCollectionReq!.productCollection;
      titleCtrl.text = collection!.title!;
      handleCtrl.text = collection!.handle ?? '';
      metadata = collection!.metadata ?? {};
    }

    super.onInit();
  }

  @override
  void onClose() {
    titleCtrl.dispose();
    handleCtrl.dispose();
    super.onClose();
  }

  Future<void> publish(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    loading();
    final result = await collectionUseCase.create(
        userCreateCollectionReq: UserCreateCollectionReq(
            title: titleCtrl.text,
            handle: handleCtrl.text.removeAllWhitespace.isEmpty
                ? null
                : handleCtrl.text));
    result.when((success) {
      EasyLoading.showSuccess('Collection Created');
      CollectionsController.instance.pagingController.refresh();
      context.popRoute();
    }, (error) {
      EasyLoading.showError('Error creating collection');
      debugPrint(error.toString());
    });
  }

  Future<void> edit(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (titleCtrl.text == collection!.title &&
        handleCtrl.text == collection!.handle &&
        metadata == collection!.metadata) {
      context.popRoute();
      return;
    }

    loading();
    final result = await collectionUseCase.update(
        id: collection!.id!,
        userCreateCollectionReq: UserCreateCollectionReq(
            title: titleCtrl.text,
            handle: handleCtrl.text.removeAllWhitespace.isEmpty
                ? null
                : handleCtrl.text));
    result.when((success) {
      EasyLoading.showSuccess('Collection updated');
      CollectionsController.instance.pagingController.refresh();
      context.popRoute(true);
    }, (error) {
      EasyLoading.showError('Error updating collection');
      debugPrint(error.toString());
    });
  }
}

class UpdateCollectionReq {
  final ProductCollection productCollection;
  UpdateCollectionReq(this.productCollection);
}
