import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';

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
}
