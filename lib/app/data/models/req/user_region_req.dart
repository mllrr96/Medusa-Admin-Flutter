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
  final String? taxCode;

  /// [EXPERIMENTAL] Tax included in prices of region
  final bool? includesTax;

  UserCreateRegionReq({
    required this.name,
    required this.currencyCode,
    required this.taxRate,
    required this.paymentProviders,
    required this.fulfillmentProviders,
    required this.countries,
    this.taxCode,
    this.includesTax,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['currency_code'] = currencyCode;
    data['tax_rate'] = taxRate;
    data['payment_providers'] = paymentProviders;
    data['fulfillment_providers'] = fulfillmentProviders;
    data['countries'] = countries;
    if (taxCode != null) {
      data['taxCode'] = taxCode;
    }
    if (includesTax != null) {
      data['includesTax'] = includesTax;
    }
    return data;
  }
}

class UserUpdateRegionReq {
  /// The name of the Region
  final String? name;

  /// The 3 character currency code that the Region uses.
  ///
  /// Example: "usd"
  final String? currencyCode;

  /// If true Medusa will automatically calculate taxes for carts in this region.
  ///
  /// If false you have to manually call POST /carts/:id/taxes.
  final bool? automaticTaxes;

  /// Whether gift cards in this region should be applied sales tax when purchasing a gift card
  final bool? giftCardsTaxable;

  /// The tax rate to use on Orders in the Region.
  final num? taxRate;

  /// The tax code used on purchases in the Region. This may be used by other systems for accounting purposes.
  final String? taxCode;

  /// A list of countries' 2 ISO Characters that should be included in the Region.
  final List<String>? countries;

  /// The ID of the tax provider to use; if null the system tax provider is used
  final String? taxProviderId;

  /// A list of Payment Provider IDs that should be enabled for the Region
  final List<String>? paymentProviderIds;

  /// A list of Fulfillment Provider IDs that should be enabled for the Region
  final List<String>? fulfillmentProviderIds;

  /// [EXPERIMENTAL] Tax included in prices of region
  final bool? includesTax;

  UserUpdateRegionReq({
    this.name,
    this.currencyCode,
    this.taxRate,
    this.taxCode,
    this.giftCardsTaxable,
    this.automaticTaxes,
    this.countries,
    this.taxProviderId,
    this.includesTax,
    this.fulfillmentProviderIds,
    this.paymentProviderIds,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (name != null) {
      json['name'] = name;
    }

    if (currencyCode != null) {
      json['currency_code'] = currencyCode;
    }
    if (taxRate != null) {
      json['tax_rate'] = taxRate;
    }

    if (taxCode != null) {
      json['tax_code'] = taxCode;
    }

    if (giftCardsTaxable != null) {
      json['gift_cards_taxable'] = giftCardsTaxable;
    }

    if (automaticTaxes != null) {
      json['automatic_taxes'] = automaticTaxes;
    }

    if (taxProviderId != null) {
      json['tax_provider_id'] = taxProviderId;
    }

    if (includesTax != null) {
      json['includes_tax'] = includesTax;
    }
    if (paymentProviderIds != null) {
      json['payment_providers'] = paymentProviderIds;
    }
    if (fulfillmentProviderIds != null) {
      json['fulfillment_providers'] = fulfillmentProviderIds;
    }

    return json;
  }
}
