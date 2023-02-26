class UserCreateRegionReq {
  /// The name of the Region
  final String name;

  /// The 3 character ISO currency code to use for the Region.
  final String currencyCode;

  /// The tax rate to use on Orders in the Region.
  final num taxRate;

  /// A list of Payment Provider IDs that should be enabled for the Region
  final List<String> paymentProviders;

  /// A list of Fulfillment Provider IDs that should be enabled for the Region
  final List<String> fulfillmentProviders;

  /// A list of countries' 2 ISO Characters that should be included in the Region.
  ///
  /// Example: ["US"]
  final List<String> countries;

  /// An optional tax code the Region.
  String? taxCode;

  /// [EXPERIMENTAL] Tax included in prices of region
  bool? includesTax;

  UserCreateRegionReq(
      {required this.name,
      required this.currencyCode,
      required this.taxRate,
      required this.paymentProviders,
      required this.fulfillmentProviders,
      required this.countries});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['currency_code'] = currencyCode;
    data['tax_rate'] = taxRate;
    data['payment_providers'] = paymentProviders;
    data['fulfillment_providers'] = fulfillmentProviders;
    data['countries'] = countries;
    data['taxCode'] = taxCode;
    data['includesTax'] = includesTax;
    return data;
  }
}
