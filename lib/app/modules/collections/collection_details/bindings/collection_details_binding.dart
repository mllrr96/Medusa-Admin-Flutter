import 'package:get/get.dart';

import '../controllers/collection_details_controller.dart';

class CollectionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollectionDetailsController>(
      () => CollectionDetailsController(),
    );
  }
}
