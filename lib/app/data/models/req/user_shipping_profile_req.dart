import '../store/shipping_profile.dart';

class UserCreateShippingProfileReq {
  /// The name of the Shipping Profile
  final String name;

  /// The type of the Shipping Profile
  final ShippingProfileType shippingProfileType;
  UserCreateShippingProfileReq({required this.name, required this.shippingProfileType});

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['name'] = name;
    json['type'] = shippingProfileType.value;
    return json;
  }
}

class UserUpdateShippingProfileReq {
  /// The name of the Shipping Profile
  final String? name;

  /// An optional array of product ids to associate with the Shipping Profile
  final List<String>? productIds;

  /// The type of the Shipping Profile
  final ShippingProfileType? shippingProfileType;

  /// An optional set of key-value pairs with additional information.
  final Map<String, dynamic>? metadata;

  /// An optional array of shipping option ids to associate with the Shipping Profile
  final List<String>? shippingOptionIds;

  UserUpdateShippingProfileReq({
    this.shippingProfileType,
    this.name,
    this.metadata,
    this.shippingOptionIds,
    this.productIds,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (name != null) {
      json['name'] = name;
    }
    if (shippingProfileType != null) {
      json['type'] = shippingProfileType!.value;
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }
    if (shippingOptionIds != null) {
      json['shipping_options'] = shippingOptionIds;
    }
    if (productIds != null) {
      json['products'] = productIds;
    }
    return json;
  }
}
