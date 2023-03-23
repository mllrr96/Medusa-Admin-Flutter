import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';

import '../controllers/collections_controller.dart';

class CollectionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollectionsController>(() => CollectionsController(collectionRepo: CollectionRepo()));
  }
}
