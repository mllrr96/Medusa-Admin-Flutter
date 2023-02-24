import 'package:get/get.dart';

import '../controllers/create_collection_controller.dart';

class CreateCollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCollectionController>(
      () => CreateCollectionController(),
    );
  }
}
