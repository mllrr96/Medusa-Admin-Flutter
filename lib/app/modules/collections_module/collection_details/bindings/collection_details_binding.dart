import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';

import '../controllers/collection_details_controller.dart';

class CollectionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollectionDetailsController>(() => CollectionDetailsController(collectionRepo: CollectionRepo()));
  }
}
