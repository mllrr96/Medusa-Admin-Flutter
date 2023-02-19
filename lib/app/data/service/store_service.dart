import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/store/store_repo.dart';

class StoreService extends GetxService {
  StoreService({required this.storeRepo});
  static StoreService instance = Get.find<StoreService>();
  static Store get store => instance._store;
  StoreRepo storeRepo;
  late Store _store;

  Future<StoreService> init() async {
    await loadStore();
    return this;
  }

  Future<void> loadStore() async {
    try {
      final result = await storeRepo.retrieve(queryParameters: {'expand': 'currencies,default_sales_channel'});
      result.fold((l) => _store = l.store, (r) {
        // Show Error loading store
        debugPrint(r.getMessage());
      });
    } catch (e) {
      debugPrint(e.toString());
      // Show Error loading store
    }
  }

  void updateStore(Store store)  {
    try {
      _store = store;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
