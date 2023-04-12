import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';

import '../../../../../../data/repository/sales_channel/sales_channel_repo.dart';
import '../controllers/sales_channel_details_controller.dart';

class SalesChannelDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesChannelDetailsController>(
        () => SalesChannelDetailsController(salesChannelRepo: SalesChannelRepo(), productsRepo: ProductsRepo()));
  }
}
