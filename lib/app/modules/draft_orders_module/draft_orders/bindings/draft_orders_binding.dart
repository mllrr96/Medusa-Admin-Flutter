import 'package:get/get.dart';

import '../../../../data/repository/draft_order/draft_order_repo.dart';
import '../controllers/draft_orders_controller.dart';

class DraftOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DraftOrdersController>(() => DraftOrdersController(draftOrderRepo: DraftOrderRepo()));
  }
}
