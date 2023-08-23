import 'index.dart';

class ShippingOption {
  /// The ID of the Shipping Option.
  String? id;

  /// The name given to the Shipping Option - this may be displayed to the Customer.
  ///
  /// Example: "PostFake Standard"
  String? name;

  /// The region's ID
  ///
  /// Example: "reg_01G1G5V26T9H8Y0M4JNE3YGA4G"
  String? regionId;

  /// A region object. Available if the relation region is expanded.
  Region? region;

  /// The ID of the Shipping Profile that the shipping option belongs to. Shipping Profiles have a set of defined Shipping Options that can be used to Fulfill a given set of Products.
  ///
  /// Example: "sp_01G1G5V239ENSZ5MV4JAR737BM"
  String? profileId;

  /// Shipping Profiles have a set of defined Shipping Options that can be used to fulfill a given set of Products.
  ShippingProfile? profile;

  /// The id of the Fulfillment Provider, that will be used to process Fulfillments from the Shipping Option.
  ///
  /// Example: "manual"
  String? providerId;

  /// Represents a fulfillment provider plugin and holds its installation status.
  FulfillmentProvider? provider;

  /// The type of pricing calculation that is used when creating Shipping Methods from the Shipping Option. Can be flat rate for fixed prices or calculated if the Fulfillment Provider can provide price calculations.
  ShippingOptionPriceType? priceType;

  /// The amount to charge for shipping when the Shipping Option price type is flat_rate.
  ///
  /// Example: 200
  int? amount;

  /// Flag to indicate if the Shipping Option can be used for Return shipments.
  ///
  /// Default: false
  bool isReturn = false;

  /// Flag to indicate if the Shipping Option usage is restricted to admin users.
  ///
  /// Default: false
  bool adminOnly = false;

  /// The requirements that must be satisfied for the Shipping Option to be available for a Cart. Available if the relation requirements is expanded.
  List<ShippingOptionRequirement>? requirements;

  /// The data needed for the Fulfillment Provider to identify the Shipping Option.
  Map<String, dynamic>? data;

  /// [EXPERIMENTAL] Does the shipping option price include tax
  ///
  /// Default: false
  bool? includesTax;

  /// The date with timezone at which the resource was created.
  DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  DateTime? deletedAt;

  /// An optional key-value map with additional details
  Map<String, dynamic>? metadata;

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
    this.adminOnly = false,
    this.requirements,
    this.data,
    this.includesTax,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  ShippingOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regionId = json['region_id'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    profileId = json['profile_id'];
    profile = json['profile'] != null
        ? ShippingProfile.fromJson(json['profile'])
        : null;
    providerId = json['provider_id'];
    provider = json['provider'] != null
        ? FulfillmentProvider.fromJson(json['provider'])
        : null;
    priceType = json['price_type'] != null
        ? ShippingOptionPriceType.values
            .firstWhere((e) => e.value == json['price_type'])
        : null;
    amount = json['amount'];
    isReturn = json['is_return'];
    adminOnly = json['admin_only'];
    if (json['requirements'] != null) {
      requirements = <ShippingOptionRequirement>[];
      json['requirements'].forEach(
          (e) => requirements!.add(ShippingOptionRequirement.fromJson(e)));
    }
    data = json['data'];
    includesTax = json['includes_tax'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '')?.toLocal();
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (id != null) {
      json['id'] = id;
    }
    if (name != null) {
      json['name'] = name;
    }

    if (regionId != null) {
      json['region_id'] = regionId;
    }

    if (region != null) {
      json['region'] = region?.toJson();
    }
    if (profileId != null) {
      json['profile_id'] = profileId;
    }
    if (profile != null) {
      json['profile'] = profile?.toJson();
    }

    if (providerId != null) {
      json['provider_id'] = providerId;
    }

    if (provider != null) {
      json['provider'] = provider;
    }
    if (priceType != null) {
      json['price_type'] = priceType?.value;
    }

    if (amount != null) {
      json['amount'] = amount;
    }

    json['is_return'] = isReturn;
    json['admin_only'] = adminOnly;

    if (requirements != null) {
      json['requirements'] =
          requirements?.map((e) => e.toJson()).toList() ?? [];
    }

    if (data != null) {
      json['data'] = data;
    }

    if (includesTax != null) {
      json['includes_tax'] = includesTax;
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

  ShippingOption copyWith({
    String? id,
    String? name,
    String? regionId,
    Region? region,
    String? profileId,
    ShippingProfile? profile,
    String? providerId,
    FulfillmentProvider? provider,
    ShippingOptionPriceType? priceType,
    int? amount,
    bool? isReturn ,
    bool? adminOnly ,
    List<ShippingOptionRequirement>? requirements,
    Map<String, dynamic>? data,
    bool? includesTax,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    Map<String, dynamic>? metadata,
  }) {
    return ShippingOption(
      name: name ?? this.name,
      region: region ?? this.region,
      regionId: regionId ?? this.regionId,
      profileId: profileId ?? this.profileId,
      providerId: providerId ?? this.providerId,
      priceType: priceType ?? this.priceType,
      includesTax: includesTax ?? this.includesTax,
      id: id ?? this.id,
      provider: provider ?? this.provider,
      profile: profile ?? this.profile,
      amount: amount ?? this.amount,
      isReturn: isReturn ?? this.isReturn,
      adminOnly: adminOnly ?? this.adminOnly,
      requirements: requirements ?? this.requirements,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      metadata: metadata ?? this.metadata,
    );
  }
}

enum ShippingOptionPriceType {
  flatRate('flat_rate'),
  calculated('calculated');

  final String value;

  const ShippingOptionPriceType(this.value);
}
