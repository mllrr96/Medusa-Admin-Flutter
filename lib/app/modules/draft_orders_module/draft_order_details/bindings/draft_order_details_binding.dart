import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/draft_order/draft_order_repo.dart';

import '../controllers/draft_order_details_controller.dart';

class DraftOrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DraftOrderDetailsController>(() => DraftOrderDetailsController(draftOrderRepo: DraftOrderRepo()));
  }
}
