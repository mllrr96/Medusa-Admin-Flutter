import 'package:medusa_admin/app/data/models/common/index.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class UserCreateClaimShipmentReq {
  /// The ID of the Fulfillment.
  final String fulfillmentId;

  /// The tracking numbers for the shipment.
  final List<String>? trackingNumbers;
  UserCreateClaimShipmentReq({required this.fulfillmentId, this.trackingNumbers});
}

class UserCreateClaimReq {
  /// The Claim Items that the Claim will consist of.
  final List<ClaimItem> claimItems;

  /// The type of the Claim.
  ///
  /// This will determine how the Claim is treated: replace Claims will result in a Fulfillment with new items being created,
  /// while a refund Claim will refund the amount paid for the claimed items.
  final ClaimType claimType;

  /// Optional details for the Return Shipping Method, if the items are to be sent back.
  final ReturnShipping? returnShipping;

  /// The Shipping Methods to send the additional Line Items with.
  final List<ShippingMethod>? shippingMethods;

  /// The amount to refund the Customer when the Claim type is refund
  final int? refundAmount;

  /// If set to true no notification will be send related to this Claim.
  final bool noNotification;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;

  /// The new items to send to the Customer when the Claim type is Replace.
  final List<Item>? additionalItems;

  final Address? shippingAddress;
  UserCreateClaimReq({
    required this.claimType,
    required this.claimItems,
    this.returnShipping,
    this.metadata,
    this.refundAmount,
    this.noNotification = false,
    this.shippingMethods,
    this.additionalItems,
    this.shippingAddress,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['type'] = claimType.value;
    json['claim_items'] = claimItems.map((e) => e.toJson()).toList();
    if (returnShipping != null) {
      json['return_shipping'] = returnShipping!.toJson();
    }
    if (additionalItems != null) {
      json['additional_items'] = additionalItems!.map((e) => e.toJson()).toList();
    }

    if (shippingMethods != null) {
      json['shipping_methods'] = shippingMethods!.map((e) => e.toJson()).toList();
    }

    if (shippingAddress != null) {
      json['shipping_address'] = shippingAddress!.toJson();
    }

    if (refundAmount != null) {
      json['refund_amount'] = refundAmount!;
    }

    if (metadata != null) {
      json['metadata'] = metadata!;
    }
    json['no_notification'] = noNotification;

    return json;
  }
}

class UserUpdateClaimReq {
  /// The Claim Items that the Claim will consist of.
  final List<ClaimItem>? claimItems;

  /// The Shipping Methods to send the additional Line Items with.
  final List<ShippingMethod>? shippingMethods;

  /// If set to true no notification will be send related to this Claim.
  final bool? noNotification;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;
  UserUpdateClaimReq({this.claimItems, this.shippingMethods, this.metadata, this.noNotification});

  Map<String, dynamic> toMap() {
    var json = <String, dynamic>{};
    if (claimItems != null) {
      json['claim_items'] = claimItems?.map((e) => e.toJson()).toList();
    }
    if (shippingMethods != null) {
      json['shipping_methods'] = shippingMethods?.map((e) => e.toJson()).toList();
    }
    if (noNotification != null) {
      json['no_notification'] = noNotification;
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }
    return json;
  }
}
