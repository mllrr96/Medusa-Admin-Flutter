import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';

import '../controllers/add_update_sales_channel_controller.dart';

class AddUpdateSalesChannelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateSalesChannelController>(
        () => AddUpdateSalesChannelController(salesChannelRepo: SalesChannelRepo()));
  }
}
