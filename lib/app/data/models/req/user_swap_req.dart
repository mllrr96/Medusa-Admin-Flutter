import '../common/item.dart';
import '../common/return_shipping.dart';

class UserCreateSwapShipmentSwapReq {
  UserCreateSwapShipmentSwapReq({required this.fulfillmentId, this.trackingNumbers, this.noNotification});

  /// The ID of the Fulfillment.
  final String fulfillmentId;

  /// The tracking numbers for the shipment.
  final List<String>? trackingNumbers;

  /// If set to true no notification will be sent related to this Claim.
  final bool? noNotification;

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['fulfillment_id'] = fulfillmentId;

    if (trackingNumbers != null) {
      json['tracking_numbers'] = trackingNumbers;
    }

    if (noNotification != null) {
      json['no_notification'] = noNotification;
    }

    return json;
  }
}

class UserCreateSwapSwapReq {
  UserCreateSwapSwapReq({
    required this.returnItems,
    this.additionalItems,
    this.allowBackOrder,
    this.noNotification,
    this.returnShippingOption,
    this.customShippingOptions,
  });

  /// The Line Items to return as part of the Swap.
  final List<Item> returnItems;

  /// The new items to send to the Customer.
  final List<Item>? additionalItems;

  /// How the Swap will be returned.
  final ReturnShipping? returnShippingOption;

  /// The custom shipping options to potentially create a Shipping Method from.
  final List<ReturnShipping>? customShippingOptions;

  /// If true, swaps can be completed with items out of stock
  ///
  /// Default: true
  final bool? allowBackOrder;

  /// If set to true no notification will be send related to this Swap.
  final bool? noNotification;

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['return_items'] = returnItems.map((e) => e.toJson()).toList();
    if (additionalItems != null) {
      json['additional_items'] = additionalItems?.map((e) => e.toJson()).toList();
    }
    if (returnShippingOption != null) {
      json['return_shipping'] = returnShippingOption?.toJson();
    }
    if (customShippingOptions != null) {
      json['custom_shipping_options'] = customShippingOptions?.map((e) => e.toJson()).toList();
    }
    if (allowBackOrder != null) {
      json['allow_backorder'] = allowBackOrder;
    }
    if (noNotification != null) {
      json['no_notification'] = noNotification;
    }

    return json;
  }
}
