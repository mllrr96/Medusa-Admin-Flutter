class UserCreateTaxRateReq {
  /// A code to identify the tax type by
  final String code;

  /// A human friendly name for the tax
  final String name;

  /// The ID of the Region that the rate belongs to
  final String regionId;

  /// The numeric rate to charge
  final num? rate;

  /// The IDs of the products associated with this tax rate
  final List<String>? productIds;

  /// The IDs of the shipping options associated with this tax rate
  final List<String>? shippingOptionIds;

  /// The IDs of the types of products associated with this tax rate
  final List<String>? productTypeIds;

  UserCreateTaxRateReq({
    required this.code,
    required this.name,
    required this.regionId,
    this.productIds,
    this.productTypeIds,
    this.rate,
    this.shippingOptionIds,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['code'] = code;
    json['name'] = name;
    json['region_id'] = regionId;

    if (productIds != null) {
      json['products'] = productIds;
    }

    if (productTypeIds != null) {
      json['product_types'] = productTypeIds;
    }

    if (shippingOptionIds != null) {
      json['shipping_options'] = shippingOptionIds;
    }

    if (rate != null) {
      json['rate'] = rate;
    }

    return json;
  }
}

class UserUpdateTaxRateReq {
  /// A code to identify the tax type by
  final String? code;

  /// A human friendly name for the tax
  final String? name;

  /// The ID of the Region that the rate belongs to
  final String? regionId;

  /// The numeric rate to charge
  final num? rate;

  /// The IDs of the products associated with this tax rate
  final List<String>? productIds;

  /// The IDs of the shipping options associated with this tax rate
  final List<String>? shippingOptionIds;

  /// The IDs of the types of products associated with this tax rate
  final List<String>? productTypeIds;

  UserUpdateTaxRateReq({
    this.code,
    this.name,
    this.regionId,
    this.productIds,
    this.productTypeIds,
    this.rate,
    this.shippingOptionIds,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (code != null) {
      json['code'] = code;
    }

    if (name != null) {
      json['name'] = name;
    }

    if (productIds != null) {
      json['region_id'] = productIds;
    }

    if (productIds != null) {
      json['products'] = productIds;
    }

    if (productTypeIds != null) {
      json['product_types'] = productTypeIds;
    }

    if (shippingOptionIds != null) {
      json['shipping_options'] = shippingOptionIds;
    }

    if (rate != null) {
      json['rate'] = rate;
    }

    return json;
  }
}
