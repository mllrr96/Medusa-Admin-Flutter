class UserCreateGiftCardReq {
  /// The ID of the Region in which the Gift Card can be used.
  final String regionId;

  /// The value (excluding VAT) that the Gift Card should represent.
  final int? value;

  /// Whether the Gift Card is disabled on creation. You will have to enable it later to make it available to Customers.
  final bool? isDisabled;

  /// The time at which the Gift Card should no longer be available.
  final DateTime? endsAt;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;

  UserCreateGiftCardReq({
    required this.regionId,
    this.value,
    this.metadata,
    this.endsAt,
    this.isDisabled,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['region_id'] = regionId;

    if (value != null) {
      json['value'] = value;
    }
    if (isDisabled != null) {
      json['is_disabled'] = isDisabled;
    }

    if (endsAt != null) {
      json['ends_at'] = endsAt;
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}

class UserUpdateGiftCardReq {
  /// The value (excluding VAT) that the Gift Card should represent.
  final int? balance;

  /// Whether the Gift Card is disabled on creation. You will have to enable it later to make it available to Customers.
  final bool? isDisabled;

  /// The time at which the Gift Card should no longer be available.
  final DateTime? endsAt;

  /// The ID of the Region in which the Gift Card can be used.
  final String? regionId;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;

  UserUpdateGiftCardReq({
    this.regionId,
    this.isDisabled,
    this.endsAt,
    this.metadata,
    this.balance,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (balance != null) {
      json['balance'] = balance;
    }

    if (regionId != null) {
      json['region_id'] = regionId;
    }

    if (endsAt != null) {
      json['ends_at'] = endsAt;
    }

    if (metadata != null) {
      json['metadata'] = metadata;
    }

    if (isDisabled != null) {
      json['is_disabled'] = isDisabled;
    }

    return json;
  }
}
