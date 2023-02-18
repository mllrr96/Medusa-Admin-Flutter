import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../data/models/store/store.dart';

class StoreDetailsController extends GetxController {
  StoreDetailsController({required this.storeRepo});
  StoreRepo storeRepo;
  late Store store;
  final storeCtrl = TextEditingController();
  final swapLinkCtrl = TextEditingController();
  final draftOrderCtrl = TextEditingController();
  final inviteLinkCtrl = TextEditingController();

  @override
  void onInit() {
    store = StoreService.store;
    storeCtrl.text = store.name;
    swapLinkCtrl.text = store.swapLinkTemplate ?? '';
    inviteLinkCtrl.text = store.inviteLinkTemplate ?? '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    storeCtrl.dispose();
    swapLinkCtrl.dispose();
    draftOrderCtrl.dispose();
    inviteLinkCtrl.dispose();
    super.onClose();
  }

  Future<void> save()async{
    try{
      loading();

    }catch(e){
      dismissLoading();
    }
  }

}
