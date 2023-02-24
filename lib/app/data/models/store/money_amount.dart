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
  Map<String, dynamic>? metadata = <String, dynamic>{};

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
    this.metadata = const <String, dynamic>{},
  });

  MoneyAmount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currencyCode = json['currency_code'];
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    amount = json['amount'];
    minQuantity = json['min_quantity'];
    maxQuantity = json['max_quantity'];
    priceListId = json['price_list_id'];
    variantId = json['variant_id'];
    variant = json['variant'] != null
        ? ProductVariant.fromJson(json['variant'])
        : null;
    regionId = json['region_id'];
    region = json['region'] != null ? Region.fromJson(json['region_id']) : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    if(metadata !=null){
      metadata = json['metadata'];
    }
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['currency_code'] = currencyCode;
    json['currency'] = currency?.toJson() ?? {};
    json['amount'] = amount;
    json['min_quantity'] = minQuantity;
    json['max_quantity'] = maxQuantity;
    json['price_list_id'] = priceListId;
    json['variant_id'] = variantId;
    json['variant'] = variant?.toJson() ?? {};
    json['region_id'] = regionId;
    json['region'] = region?.toJson() ?? {};
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    if(metadata!=null){
    json['metadata'] = metadata;
    }
    return json;
  }
}
