import 'package:medusa_admin_dart_client/medusa_admin.dart';

class AddUpdateTaxRateReq {
  final String regionId;
  final TaxRate? taxRate;
  AddUpdateTaxRateReq({
    required this.regionId,
    this.taxRate,
  });
}