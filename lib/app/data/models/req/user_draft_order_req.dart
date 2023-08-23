import 'package:medusa_admin/app/data/models/store/index.dart';

class UserCreateDraftOrderReq {
  /// The email of the customer of the draft order
  final String email;

  /// The ID of the region for the draft order
  final String regionId;

  /// The shipping methods for the draft order
  final List<ShippingMethod> shippingMethods;

  /// The status of the draft order
  ///
  /// Default: "open"
  final DraftOrderStatus orderStatus;

  /// The Address to be used for billing purposes.
  final Address? billingAddress;

  /// The Address to be used for shipping.
  final Address? shippingAddress;

  /// The Line Items that have been received.
  final List<LineItem>? items;

  /// The discounts to add on the draft order
  final List<String>? discounts;

  ///The ID of the customer to add on the draft order
  final String? customerId;

  /// An optional flag passed to the resulting order to determine use of notifications.
  final bool? noNotification;

  /// The optional key-value map with additional details about the Draft Order.
  final Map<String, dynamic>? metadata;

  UserCreateDraftOrderReq({
    required this.email,
    required this.regionId,
    required this.shippingMethods,
    this.orderStatus = DraftOrderStatus.open,
    this.customerId,
    this.items,
    this.metadata,
    this.noNotification,
    this.shippingAddress,
    this.billingAddress,
    this.discounts,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['email'] = email;
    json['region_id'] = regionId;
    json['shipping_methods'] = shippingMethods.map((e) => e.toJson()).toList();
    json['status'] = orderStatus.value;

    if (metadata != null) {
      json['metadata'] = metadata;
    }

    if (noNotification != null) {
      json['no_notification'] = noNotification;
    }

    if (shippingAddress != null) {
      Address shipping = Address(
        firstName: shippingAddress!.firstName,
        lastName: shippingAddress!.lastName,
        company: shippingAddress!.company,
        phone: shippingAddress!.phone,
        address1: shippingAddress!.address1,
        address2: shippingAddress!.address2,
        postalCode: shippingAddress!.postalCode,
        city: shippingAddress!.city,
        province: shippingAddress!.province,
        countryCode: shippingAddress!.country?.iso2,
      );
      json['shipping_address'] = shipping.toJson();
    }

    if (billingAddress != null) {
      Address billing = Address(
        firstName: billingAddress!.firstName,
        lastName: billingAddress!.lastName,
        company: billingAddress!.company,
        phone: billingAddress!.phone,
        address1: billingAddress!.address1,
        address2: billingAddress!.address2,
        postalCode: billingAddress!.postalCode,
        city: billingAddress!.city,
        province: billingAddress!.province,
        countryCode: billingAddress!.country?.iso2,
      );
      json['billing_address'] = billing.toJson();
    }

    if (customerId != null) {
      json['customer_id'] = customerId;
    }

    if (items != null) {
      List<LineItem> newItems = [];
      for (var item in items!) {
        // Custom item
        if (item.variantId == null) {
          newItems.add(LineItem(
            unitPrice: item.unitPrice,
            quantity: item.quantity,
            title: item.title,
          ));
        } else {
          newItems.add(LineItem(
            variantId: item.variantId,
            quantity: item.quantity,
          ));
        }
      }

      json['items'] = newItems.map((e) => e.toJson()).toList();
    }

    if (discounts != null) {
      json['discounts'] = discounts;
    }

    return json;
  }
}

class UserUpdateDraftOrderReq {
  /// The email of the customer of the draft order
  final String? email;

  /// The ID of the region for the draft order
  final String? regionId;

  /// The 2 character ISO code for the Country.
  final String? countryCode;

  /// The Address to be used for billing purposes.
  final Address? billingAddress;

  /// The Address to be used for shipping.
  final Address? shippingAddress;

  /// The discounts to add on the draft order
  final List<String>? discounts;

  ///The ID of the customer to add on the draft order
  final String? customerId;

  /// An optional flag passed to the resulting order to determine use of notifications.
  final bool? noNotification;

  UserUpdateDraftOrderReq({
    this.email,
    this.regionId,
    this.countryCode,
    this.customerId,
    this.noNotification,
    this.shippingAddress,
    this.billingAddress,
    this.discounts,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (countryCode != null) {
      json['country_code'] = countryCode;
    }
    if (email != null) {
      json['email'] = email;
    }
    if (regionId != null) {
      json['region_id'] = regionId;
    }
    if (noNotification != null) {
      json['no_notification'] = noNotification;
    }

    if (shippingAddress != null) {
      json['shipping_address'] = shippingAddress!.toJson();
    }

    if (billingAddress != null) {
      json['billing_address'] = billingAddress!.toJson();
    }

    if (customerId != null) {
      json['customer_id'] = customerId;
    }

    if (discounts != null) {
      json['discounts'] = discounts;
    }

    return json;
  }
}

class UserCreateLineItemReq {
  /// The quantity of the Line Item.
  final int quantity;

  /// The ID of the Product Variant to generate the Line Item from.
  final String? variantId;

  /// The potential custom price of the item.
  final int? unitPrice;

  /// The potential custom title of the item.
  ///
  /// Default: "Custom item"
  final String? title;

  /// The optional key-value map with additional details about the Line Item.
  final Map<String, dynamic>? metadata;

  UserCreateLineItemReq({
    required this.quantity,
    this.metadata,
    this.variantId,
    this.title,
    this.unitPrice,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['quantity'] = quantity;
    if (metadata != null) {
      json['metadata'] = metadata;
    }

    if (variantId != null) {
      json['variant_id'] = variantId;
    }

    if (title != null) {
      json['title'] = title;
    }

    if (unitPrice != null) {
      json['unit_price'] = unitPrice;
    }

    return json;
  }
}

class UserUpdateLineItemReq {
  /// The quantity of the Line Item.
  final int? quantity;

  /// The potential custom price of the item.
  final int? unitPrice;

  /// The potential custom title of the item.
  ///
  /// Default: "Custom item"
  final String? title;

  /// The optional key-value map with additional details about the Line Item.
  final Map<String, dynamic>? metadata;

  UserUpdateLineItemReq({
    this.quantity,
    this.metadata,
    this.title,
    this.unitPrice,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['quantity'] = quantity;
    if (metadata != null) {
      json['metadata'] = metadata;
    }

    if (title != null) {
      json['title'] = title;
    }

    if (unitPrice != null) {
      json['unit_price'] = unitPrice;
    }

    return json;
  }
}
