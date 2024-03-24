import 'package:medusa_admin_dart_client/medusa_admin.dart';

class AddUpdateShippingOptionReq {
  AddUpdateShippingOptionReq({
    required this.region,
    this.shippingOption,
    this.returnShippingOption = false,
  });
  final Region region;
  final ShippingOption? shippingOption;
  final bool returnShippingOption;
}
