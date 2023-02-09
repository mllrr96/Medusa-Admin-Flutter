import 'index.dart';

class ShippingOption {
  String? id;
  String? name;
  String? regionId;
  Region? region;
  String? profileId;
  ShippingProfile? profile;
  String? providerId;
  FulfillmentProvider? provider;
  ShippingOptionPriceType? priceType;
  int? amount;
  bool isReturn = false;
  List<ShippingOptionRequirement>? requirements;
  Map<String, dynamic> data = {};
  bool? includesTax;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  ShippingOption({
    this.id,
    required this.name,
    required this.regionId,
    this.region,
    required this.profileId,
    this.profile,
    required this.providerId,
    this.provider,
    required this.priceType,
    this.amount,
    this.isReturn = false,
    this.requirements,
    this.data = const {},
    this.includesTax,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const <String, dynamic>{},
  });

  ShippingOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regionId = json['region_id'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    profileId = json['profile_id'];
    profile = json['profile'] != null ? ShippingProfile.fromJson(json['profile']) : null;
    providerId = json['provider_id'];
    provider = json['provider'] != null ? FulfillmentProvider.fromJson(json['provider']) : null;
    // priceType = json['price_type'] != null
    //     ? ShippingOptionPriceType.values
    //         .firstWhere((e) => e.value == json['price_type'])
    //     : null;
    amount = json['amount'];
    isReturn = json['is_return'];
    if (json['requirements'] != null) {
      requirements = <ShippingOptionRequirement>[];
      json['requirements'].forEach((e) => requirements!.add(ShippingOptionRequirement.fromJson(json['requirements'])));
    }
    data = json['data'];
    includesTax = json['includes_tax'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? <String, dynamic>{};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['region_id'] = regionId;
    json['region'] = region?.toJson();
    json['profile_id'] = profileId;
    json['profile'] = profile?.toJson();
    json['provider_id'] = providerId;
    json['provider'] = provider;
    json['price_type'] = priceType?.value;
    json['amount'] = amount;
    json['is_return'] = isReturn;
    json['requirements'] = requirements?.map((e) => e.toJson()).toList() ?? [];
    json['data'] = data;
    json['includes_tax'] = includesTax;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

enum ShippingOptionPriceType {
  flatRate('flatRate'),
  calculated('calculated');

  final String value;

  const ShippingOptionPriceType(this.value);
}
