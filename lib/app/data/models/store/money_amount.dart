import 'index.dart';

class MoneyAmount {
  String? id;
  String? currencyCode;
  Currency? currency;
  int? amount;
  int? minQuantity;
  int? maxQuantity;
  String? priceListId;
  List<PriceList>? priceList;
  String? variantId;
  ProductVariant? variant;
  String? regionId;
  Region? region;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;
  Map<String, dynamic>? metadata;

  MoneyAmount({
    this.id,
    this.currencyCode,
    this.currency,
    this.amount,
    this.minQuantity,
    this.maxQuantity,
    this.priceListId,
    this.priceList,
    this.variantId,
    this.variant,
    this.regionId,
    this.region,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  MoneyAmount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currencyCode = json['currency_code'];
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    amount = json['amount'];
    minQuantity = json['min_quantity'];
    maxQuantity = json['max_quantity'];
    priceListId = json['price_list_id'];
    variantId = json['variant_id'];
    variant = json['variant'] != null ? ProductVariant.fromJson(json['variant']) : null;
    regionId = json['region_id'];
    region = json['region'] != null ? Region.fromJson(json['region_id']) : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    if (metadata != null) {
      metadata = json['metadata'];
    }
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (id != null) {
      json['id'] = id;
    }
    if (currencyCode != null) {
      json['currency_code'] = currencyCode;
    }
    if (currency != null) {
      json['currency'] = currency?.toJson();
    }
    if (amount != null) {
      json['amount'] = amount;
    }
    if (minQuantity != null) {
      json['min_quantity'] = minQuantity;
    }
    if (maxQuantity != null) {
      json['max_quantity'] = maxQuantity;
    }
    if (priceListId != null) {
      json['price_list_id'] = priceListId;
    }
    if (variantId != null) {
      json['variant_id'] = variantId;
    }
    if (variant != null) {
      json['variant'] = variant?.toJson() ?? {};
    }
    if (regionId != null) {
      json['region_id'] = regionId;
    }
    if (region != null) {
      json['region'] = region?.toJson() ?? {};
    }
    if (createdAt != null) {
      json['created_at'] = createdAt.toString();
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt.toString();
    }
    if (deletedAt != null) {
      json['deleted_at'] = deletedAt.toString();
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }
    return json;
  }
}
