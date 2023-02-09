import 'index.dart';

class Region {
  String? id;
  String? name;
  String? currencyCode;
  Currency? currency;
  num? taxRate;
  List<TaxRate>? taxRates;
  String? taxCode;
  bool giftCardsTaxable = true;
  bool automaticTaxes = true;
  List<Country>? countries;
  String? taxProviderId;
  TaxProvider? taxProvider;
  List<PaymentProvider>? paymentProviders;
  List<FulfillmentProvider>? fulfillmentProviders;
  bool? includesTax;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

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
    this.metadata = const <String, dynamic>{},
  });

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    currencyCode = json['currency_code'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    taxRate = json['tax_rate'];
    if (json['tax_rates'] != null) {
      taxRates = <TaxRate>[];
      json['tax_rates']
          .forEach((e) => taxRates!.add(TaxRate.fromJson(json['tax_rates'])));
    }
    taxCode = json['tax_code'];
    giftCardsTaxable = json['gift_cards_taxable'];
    automaticTaxes = json['automatic_taxes'];
    if (json['countries'] != null) {
      countries = <Country>[];
      json['countries'].forEach((e) => countries!.add(Country.fromJson(e)));
    }
    taxProviderId = json['tax_provider_id'];
    taxProvider = json['tax_provider'] != null
        ? TaxProvider.fromJson(json['tax_provider'])
        : null;
    if (json['payment_providers'] != null) {
      paymentProviders = <PaymentProvider>[];
      json['payment_providers']
          .forEach((e) => paymentProviders!.add(PaymentProvider.fromJson(e)));
    }
    if (json['fulfillment_providers'] != null) {
      fulfillmentProviders = <FulfillmentProvider>[];
      json['fulfillment_providers'].forEach(
          (e) => fulfillmentProviders!.add(FulfillmentProvider.fromJson(e)));
    }
    includesTax = json['includes_tax'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['currency_code'] = currencyCode;
    json['currency'] = currency?.toJson() ?? {};
    json['tax_rate'] = taxRate;
    json['tax_rates'] = taxRates?.map((e) => e.toJson()).toList() ?? [];
    json['tax_code'] = taxCode;
    json['gift_cards_taxable'] = giftCardsTaxable;
    json['automatic_taxes'] = automaticTaxes;
    json['countries'] = countries?.map((e) => e.toJson()).toList() ?? [];
    json['tax_provider_id'] = taxProviderId;
    json['tax_provider'] = taxProvider?.toJson();
    json['payment_providers'] =
        paymentProviders?.map((e) => e.toJson()).toList() ?? [];
    json['fulfillment_providers'] =
        fulfillmentProviders?.map((e) => e.toJson()).toList() ?? [];
    json['includes_tax'] = includesTax;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
