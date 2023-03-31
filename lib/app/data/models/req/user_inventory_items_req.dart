class UserCreateInventoryLocationForInventoryItemReq {
  /// the item location ID
  final String locationId;

  /// the stock quantity of an inventory item at the given location ID
  final int stockedQuantity;

  /// the incoming stock quantity of an inventory item at the given location ID
  final int? incomingQuantity;

  UserCreateInventoryLocationForInventoryItemReq({
    required this.locationId,
    required this.stockedQuantity,
    this.incomingQuantity,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['location_id'] = locationId;
    json['stocked_quantity'] = stockedQuantity;
    if (incomingQuantity != null) {
      json['incoming_quantity'] = incomingQuantity;
    }

    return json;
  }
}

class UserUpdateInventoryItemReq {
  /// The Harmonized System code of the Inventory Item.
  /// May be used by Fulfillment Providers to pass customs information to shipping carriers.
  final String? hsCode;

  /// The Manufacturers Identification code that identifies the manufacturer of the Inventory Item.
  /// May be used by Fulfillment Providers to pass customs information to shipping carriers.
  final String? midCode;

  /// The country in which the Inventory Item was produced.
  /// May be used by Fulfillment Providers to pass customs information to shipping carriers.
  final String? originCountry;

  /// The material and composition that the Inventory Item is made of,
  /// May be used by Fulfillment Providers to pass customs information to shipping carriers.
  final String? material;

  /// The weight of the Inventory Item. May be used in shipping rate calculations.
  final num? weight;

  /// The height of the Inventory Item. May be used in shipping rate calculations.
  final num? height;

  /// The width of the Inventory Item. May be used in shipping rate calculations.
  final num? width;

  /// The length of the Inventory Item. May be used in shipping rate calculations.
  final num? length;

  /// Whether the item requires shipping.
  final bool? requiresShipping;

  UserUpdateInventoryItemReq({
    this.length,
    this.material,
    this.height,
    this.originCountry,
    this.hsCode,
    this.midCode,
    this.weight,
    this.width,
    this.requiresShipping,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (length != null) {
      json['length'] = length;
    }
    if (material != null) {
      json['material'] = material;
    }
    if (height != null) {
      json['height'] = height;
    }
    if (originCountry != null) {
      json['origin_country'] = originCountry;
    }
    if (hsCode != null) {
      json['hs_code'] = hsCode;
    }
    if (midCode != null) {
      json['mid_code'] = midCode;
    }
    if (weight != null) {
      json['weight'] = weight;
    }
    if (width != null) {
      json['width'] = width;
    }
    if (requiresShipping != null) {
      json['requires_shipping'] = requiresShipping;
    }

    return json;
  }

  factory UserUpdateInventoryItemReq.fromJson(Map<String, dynamic> json) {
    return UserUpdateInventoryItemReq(
      width: json['width'],
      height: json['height'],
      length: json['length'],
      weight: json['weight'],
      material: json['material'],
      originCountry: json['origin_country'],
      requiresShipping: json['requires_shipping'],
      hsCode: json['hs_code'],
      midCode: json['mid_code'],
    );
  }
}
