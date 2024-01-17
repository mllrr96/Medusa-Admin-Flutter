import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/data/service/store_service.dart';
import 'package:medusa_admin/domain/use_case/update_store_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/extension/extension.dart';

class StoreDetailsController extends GetxController {
  StoreDetailsController({required this.updateStoreUseCase});
  UpdateStoreUseCase updateStoreUseCase;
  late Store? store;
  final storeCtrl = TextEditingController();
  final swapLinkCtrl = TextEditingController();
  final draftOrderCtrl = TextEditingController();
  final inviteLinkCtrl = TextEditingController();
  final keyFrom = GlobalKey<FormState>();

  @override
  void onInit() {
    store = StoreService.store;
    storeCtrl.text = store?.name ?? '';
    swapLinkCtrl.text = store?.swapLinkTemplate ?? '';
    inviteLinkCtrl.text = store?.inviteLinkTemplate ?? '';
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
    if (storeCtrl.text == store?.name &&
        (swapLinkCtrl.text == store?.swapLinkTemplate ||
            swapLinkCtrl.text.isEmpty) &&
        (inviteLinkCtrl.text == store?.inviteLinkTemplate ||
            inviteLinkCtrl.text.isEmpty)) {
      context.popRoute();
      return;
    }

    if (!keyFrom.currentState!.validate()) {
      return;
    }
    context.unfocus();

    loading();
    final result = await updateStoreUseCase(StorePostReq(
        name: storeCtrl.text,
        swapLinkTemplate: swapLinkCtrl.text.removeAllWhitespace.isEmpty
            ? null
            : swapLinkCtrl.text,
        inviteLinkTemplate: inviteLinkCtrl.text.removeAllWhitespace.isEmpty
            ? null
            : inviteLinkCtrl.text));
    result.when((store) {
      StoreService.instance.updateStore(store);
      EasyLoading.showSuccess('Store details updated')
          .then((value) => context.popRoute());
    }, (error) {
      debugPrint(error.message);
      EasyLoading.showError('Error updating store details');
    });
    dismissLoading();
  }
}
