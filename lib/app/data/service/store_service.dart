import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class StoreService extends GetxService {
  StoreService({required this.storeRepo});
  static StoreService get instance => Get.find<StoreService>();
  static Store get store => instance._store;
  StoreRepository storeRepo;
  late Store _store;

  Future<StoreService> init() async {
    await loadStore();
    return this;
  }

  Future<void> loadStore() async {
    try {
      final store = await storeRepo.retrieve(queryParameters: {'expand': 'currencies,default_sales_channel'});
      if(store != null){
        _store = store;
      }
    } catch (e) {
      debugPrint(e.toString());
      // Show Error loading store
    }
  }

  void updateStore(Store store) {
    try {
      _store = store;
    } catch (e) {
      debugPrint(e.toString());
    }
  }


}
