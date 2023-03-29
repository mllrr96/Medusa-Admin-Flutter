import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class UserTaxRateRes {
  final TaxRate? taxRate;
  UserTaxRateRes(this.taxRate);

  factory UserTaxRateRes.fromJson(Map<String, dynamic> json) {
    return UserTaxRateRes(json['tax_rate'] != null ? TaxRate.fromJson(json['tax_rate']) : null);
  }
}

class UserRetrieveTaxRatesRes extends PaginatedResponse {
  List<TaxRate>? taxRates;

  UserRetrieveTaxRatesRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['tax_rates'] == null) return;

    taxRates = <TaxRate>[];
    json['tax_rates'].forEach((v) => taxRates!.add(TaxRate.fromJson(v)));
  }
}

class UserDeleteTaxRateRes {
  /// The ID of the deleted Order Edit Item Change.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "item_change"
  final String? object;

  /// Whether or not the Order Edit Item Change was deleted.
  final bool deleted;
  UserDeleteTaxRateRes({required this.deleted, this.id, this.object});
  factory UserDeleteTaxRateRes.fromJson(json) {
    return UserDeleteTaxRateRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
