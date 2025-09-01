import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class AddUpdateTaxRateReq {
  final String regionId;
  final TaxRate? taxRate;
  AddUpdateTaxRateReq({
    required this.regionId,
    this.taxRate,
  });
}