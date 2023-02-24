import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';

import '../controllers/create_collection_controller.dart';

class CreateCollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCollectionController>(
      () => CreateCollectionController(collectionRepo: CollectionRepo()),
    );
  }
}
