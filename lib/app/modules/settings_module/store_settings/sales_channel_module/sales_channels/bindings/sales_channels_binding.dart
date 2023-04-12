import 'package:get/get.dart';

import '../../../../../../data/repository/sales_channel/sales_channel_repo.dart';
import '../controllers/sales_channels_controller.dart';

class SalesChannelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesChannelsController>(() => SalesChannelsController(salesChannelRepo: SalesChannelRepo()));
  }
}
