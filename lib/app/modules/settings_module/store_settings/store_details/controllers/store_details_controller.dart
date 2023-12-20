import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../../data/models/req/store_post_req.dart';
import '../../../../../data/models/store/store.dart';

class StoreDetailsController extends GetxController {
  StoreDetailsController({required this.storeRepo});
  StoreRepo storeRepo;
  late Store store;
  final storeCtrl = TextEditingController();
  final swapLinkCtrl = TextEditingController();
  final draftOrderCtrl = TextEditingController();
  final inviteLinkCtrl = TextEditingController();
  final keyFrom = GlobalKey<FormState>();

  @override
  void onInit() {
    store = StoreService.store;
    storeCtrl.text = store.name;
    swapLinkCtrl.text = store.swapLinkTemplate ?? '';
    inviteLinkCtrl.text = store.inviteLinkTemplate ?? '';
    super.onInit();
  }


  @override
  void onClose() {
    storeCtrl.dispose();
    swapLinkCtrl.dispose();
    draftOrderCtrl.dispose();
    inviteLinkCtrl.dispose();
    super.onClose();
  }

  Future<void> save(BuildContext context) async {
    if (storeCtrl.text == store.name &&
        (swapLinkCtrl.text == store.swapLinkTemplate || swapLinkCtrl.text.isEmpty) &&
        (inviteLinkCtrl.text == store.inviteLinkTemplate || inviteLinkCtrl.text.isEmpty)) {
      context.popRoute();
      return;
    }

    if (!keyFrom.currentState!.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();

    loading();
    final result = await storeRepo.update(
        storePostReq: StorePostReq(
            name: storeCtrl.text,
            swapLinkTemplate: swapLinkCtrl.text.removeAllWhitespace.isEmpty ? null : swapLinkCtrl.text,
            inviteLinkTemplate: inviteLinkCtrl.text.removeAllWhitespace.isEmpty ? null : inviteLinkCtrl.text));
    result.when((success) {
      StoreService.instance.updateStore(success.store);
      EasyLoading.showSuccess('Store details updated').then((value) => context.popRoute());
    }, (error)  {
      debugPrint(error.message);
      EasyLoading.showError('Error updating store details');
    });
    dismissLoading();
  }
}
