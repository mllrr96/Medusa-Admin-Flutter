import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/components/choose_customer.dart';

import '../../../../data/repository/shipping_options/shipping_options_repo.dart';
import '../components/index.dart';
import '../controllers/create_draft_order_controller.dart';

class CreateDraftOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateDraftOrderController>(() => CreateDraftOrderController());
    Get.lazyPut<ChooseCustomerController>(() => ChooseCustomerController());
    Get.lazyPut<ChooseRegionController>(() => ChooseRegionController(regionsRepo: RegionsRepo()));
    // Get.lazyPut<ChooseShippingMethodController>(
    //     () => ChooseShippingMethodController(shippingOptionsRepo: ShippingOptionsRepo()));
    Get.put(ChooseShippingMethodController(shippingOptionsRepo: ShippingOptionsRepo()));

  }
}
