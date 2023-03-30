import 'package:medusa_admin/app/data/models/store/index.dart';

class UserCreatePriceListReq {
  /// The name of the Price List
  final String name;

  /// A description of the Price List.
  final String description;

  /// The type of the Price List.
  final PriceListType type;

  /// The prices of the Price List.
  final List<Price> prices;

  /// The date with timezone that the Price List starts being valid.
  final DateTime? startsAt;

  /// The date with timezone that the Price List ends being valid.
  final DateTime? endsAt;

  /// The status of the Price List.
  final PriceListStatus? status;

  /// A list of customer groups that the Price List applies to.
  final List<String>? customerGroupIds;

  /// [EXPERIMENTAL] Tax included in prices of price list
  final bool? includeTax;

  UserCreatePriceListReq({
    required this.name,
    required this.description,
    required this.type,
    required this.prices,
    this.status,
    this.endsAt,
    this.customerGroupIds,
    this.startsAt,
    this.includeTax,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['name'] = name;
    json['description'] = description;
    json['type'] = type.value;
    json['prices'] = prices.map((e) => e.toJson()).toList();

    if (startsAt != null) {
      json['starts_at'] = startsAt;
    }

    if (includeTax != null) {
      json['include_tax'] = includeTax;
    }

    if (customerGroupIds != null) {
      json['customer_groups'] = customerGroupIds;
    }

    if (endsAt != null) {
      json['ends_at'] = endsAt;
    }

    if (status != null) {
      json['status'] = status!.value;
    }

    return json;
  }
}

class UserUpdatePriceListReq {
  /// The name of the Price List
  final String? name;

  /// A description of the Price List.
  final String? description;

  /// The type of the Price List.
  final PriceListType? type;

  /// The prices of the Price List.
  final List<Price>? prices;

  /// The date with timezone that the Price List starts being valid.
  final DateTime? startsAt;

  /// The date with timezone that the Price List ends being valid.
  final DateTime? endsAt;

  /// The status of the Price List.
  final PriceListStatus? status;

  /// A list of customer groups that the Price List applies to.
  final List<String>? customerGroupIds;

  /// [EXPERIMENTAL] Tax included in prices of price list
  final bool? includeTax;

  UserUpdatePriceListReq({
    this.name,
    this.description,
    this.type,
    this.prices,
    this.status,
    this.endsAt,
    this.customerGroupIds,
    this.startsAt,
    this.includeTax,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (name != null) {
      json['name'] = name;
    }
    if (description != null) {
      json['description'] = description;
    }
    if (type != null) {
      json['type'] = type!.value;
    }
    if (prices != null) {
      json['prices'] = prices!.map((e) => e.toJson()).toList();
    }

    if (startsAt != null) {
      json['starts_at'] = startsAt;
    }

    if (includeTax != null) {
      json['include_tax'] = includeTax;
    }

    if (customerGroupIds != null) {
      json['customer_groups'] = customerGroupIds;
    }

    if (endsAt != null) {
      json['ends_at'] = endsAt;
    }

    if (status != null) {
      json['status'] = status!.value;
    }

    return json;
  }
}

class UserUpdatePricesReq {
  List<Price> prices;

  /// If true the prices will replace all existing prices associated with the Price List.
  final bool? override;

  UserUpdatePricesReq({required this.prices, this.override});

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['prices'] = prices.map((e) => e.toJson()).toList();
    if (override != null) {
      json['override'] = override;
    }

    return json;
  }
}

class Price {
  /// The amount to charge for the Product Variant.
  final int amount;

  /// The ID of the Variant for which the price is used.
  final String variantId;

  /// The ID of the price.
  final String? id;

  /// The ID of the Region for which the price is used. Only required if currency_code is not provided.
  final String? regionId;

  /// The 3 character ISO currency code for which the price will be used.
  ///
  /// Only required if region_id is not provided.
  final String? currencyCode;

  /// The minimum quantity for which the price will be used.
  final int? minQuantity;

  /// The maximum quantity for which the price will be used.
  final int? maxQuantity;

  Price({
    required this.amount,
    required this.variantId,
    this.id,
    this.regionId,
    this.currencyCode,
    this.maxQuantity,
    this.minQuantity,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['amount'] = amount;
    json['variant_id'] = variantId;

    if (id != null) {
      json['id'] = id;
    }

    if (regionId != null) {
      json['region_id'] = regionId;
    }

    if (currencyCode != null) {
      json['currency_code'] = currencyCode;
    }

    if (maxQuantity != null) {
      json['max_quantity'] = maxQuantity;
    }

    if (minQuantity != null) {
      json['min_quantity'] = minQuantity;
    }

    return json;
  }
}
