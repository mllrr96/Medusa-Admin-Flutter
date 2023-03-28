import 'index.dart';

class Region {
  /// The region's ID
  String? id;

  /// The name of the region as displayed to the customer.
  /// If the Region only has one country it is recommended to write the country name.
  ///
  /// Example: "EU"
  String? name;

  /// The 3 character currency code that the Region uses.
  ///
  /// Example: "usd"
  String? currencyCode;
  Currency? currency;

  /// The tax rate that should be charged on purchases in the Region.
  num? taxRate;

  /// The tax rates that are included in the Region.
  ///
  /// Available if the relation tax_rates is expanded.
  List<TaxRate>? taxRates;

  /// The tax code used on purchases in the Region. This may be used by other systems for accounting purposes.
  String? taxCode;

  /// Whether the gift cards are taxable or not in this region.
  bool? giftCardsTaxable;

  /// Whether taxes should be automated in this region.
  bool? automaticTaxes;

  /// The countries that are included in the Region.
  ///
  /// Available if the relation countries is expanded.
  List<Country>? countries;

  /// The ID of the tax provider used in this region
  String? taxProviderId;

  /// The tax service used to calculate taxes
  TaxProvider? taxProvider;

  /// The Payment Providers that can be used to process Payments in the Region.
  ///
  /// Available if the relation payment_providers is expanded.
  List<PaymentProvider>? paymentProviders;

  /// The Fulfillment Providers that can be used to fulfill orders in the Region.
  ///
  /// Available if the relation fulfillment_providers is expanded.
  List<FulfillmentProvider>? fulfillmentProviders;

  /// [EXPERIMENTAL] Does the prices for the region include tax
  bool? includesTax;

  /// The date with timezone at which the resource was created.
  DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  DateTime? deletedAt;

  /// An optional key-value map with additional details
  Map<String, dynamic>? metadata;

  Region({
    this.id,
    required this.name,
    required this.currencyCode,
    this.currency,
    required this.taxRate,
    this.taxRates,
    this.taxCode,
    this.giftCardsTaxable = true,
    this.automaticTaxes = true,
    this.countries,
    this.taxProviderId,
    this.taxProvider,
    this.paymentProviders,
    this.fulfillmentProviders,
    this.includesTax,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    currencyCode = json['currency_code'];
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    taxRate = json['tax_rate'];
    if (json['tax_rates'] != null) {
      taxRates = <TaxRate>[];
      json['tax_rates'].forEach((e) => taxRates!.add(TaxRate.fromJson(json['tax_rates'])));
    }
    taxCode = json['tax_code'];
    giftCardsTaxable = json['gift_cards_taxable'];
    automaticTaxes = json['automatic_taxes'];
    if (json['countries'] != null) {
      countries = <Country>[];
      json['countries'].forEach((e) => countries!.add(Country.fromJson(e)));
    }
    taxProviderId = json['tax_provider_id'];
    taxProvider = json['tax_provider'] != null ? TaxProvider.fromJson(json['tax_provider']) : null;
    if (json['payment_providers'] != null) {
      paymentProviders = <PaymentProvider>[];
      json['payment_providers'].forEach((e) => paymentProviders!.add(PaymentProvider.fromJson(e)));
    }
    if (json['fulfillment_providers'] != null) {
      fulfillmentProviders = <FulfillmentProvider>[];
      json['fulfillment_providers'].forEach((e) => fulfillmentProviders!.add(FulfillmentProvider.fromJson(e)));
    }
    includesTax = json['includes_tax'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['currency_code'] = currencyCode;
    json['currency'] = currency?.toJson();
    json['tax_rate'] = taxRate;
    json['tax_rates'] = taxRates?.map((e) => e.toJson()).toList();
    json['tax_code'] = taxCode;
    json['gift_cards_taxable'] = giftCardsTaxable;
    json['automatic_taxes'] = automaticTaxes;
    json['countries'] = countries?.map((e) => e.toJson()).toList();
    json['tax_provider_id'] = taxProviderId;
    json['tax_provider'] = taxProvider?.toJson();
    json['payment_providers'] = paymentProviders?.map((e) => e.toJson()).toList();
    json['fulfillment_providers'] = fulfillmentProviders?.map((e) => e.toJson()).toList();
    json['includes_tax'] = includesTax;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
