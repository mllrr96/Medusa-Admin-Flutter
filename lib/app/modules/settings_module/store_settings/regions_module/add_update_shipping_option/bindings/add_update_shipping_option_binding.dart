import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/data/repository/shipping_options/shipping_options_repo.dart';
import '../../../../../../data/repository/shipping_profile/shipping_profile_repo.dart';
import '../controllers/add_update_shipping_option_controller.dart';

class AddUpdateShippingOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateShippingOptionController>(
      () => AddUpdateShippingOptionController(
        shippingProfileRepo: ShippingProfileRepo(),
        regionsRepo: RegionsRepo(),
        shippingOptionsRepo: ShippingOptionsRepo(),
      ),
    );
  }
}
