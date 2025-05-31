/// OrderShippingMethodAdjustment
/// {
///     "properties": {
///         "shipping_method": {
///             "type": "object"
///         },
///         "shipping_method_id": {
///             "type": "string",
///             "description": "The ID of the shipping method this adjustment is for.",
///             "title": "shipping_method_id"
///         },
///         "id": {
///             "type": "string",
///             "description": "The adjustment's ID.",
///             "title": "id"
///         },
///         "code": {
///             "type": "string",
///             "description": "The adjustment's code.",
///             "title": "code"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The adjustment's amount.",
///             "title": "amount"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the associated order.",
///             "title": "order_id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The adjustment's description.",
///             "title": "description"
///         },
///         "promotion_id": {
///             "type": "string",
///             "description": "The ID of the promotion this adjustment applies.",
///             "title": "promotion_id"
///         },
///         "provider_id": {
///             "type": "string",
///             "description": "The adjustment's provider ID.",
///             "title": "provider_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the adjustment was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the adjustment was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "shipping_method",
///         "shipping_method_id",
///         "id",
///         "amount",
///         "order_id",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The shipping method adjustment's details."
/// }
library;

import 'exports.dart';
part 'order_shipping_method_adjustment.freezed.dart';
part 'order_shipping_method_adjustment.g.dart'; // OrderShippingMethodAdjustment

@freezed
abstract class OrderShippingMethodAdjustment
    with _$OrderShippingMethodAdjustment {
  const OrderShippingMethodAdjustment._();

  @jsonSerializable
  const factory OrderShippingMethodAdjustment({
    /// shippingMethod
    @JsonKey(name: OrderShippingMethodAdjustment.shippingMethodKey)
    required Map<String, dynamic> shippingMethod,

    /// shippingMethodId
    @JsonKey(name: OrderShippingMethodAdjustment.shippingMethodIdKey)
    required String shippingMethodId,

    /// id
    @JsonKey(name: OrderShippingMethodAdjustment.idKey) required String id,

    /// code
    @JsonKey(name: OrderShippingMethodAdjustment.codeKey) required String code,

    /// amount
    @JsonKey(name: OrderShippingMethodAdjustment.amountKey)
    required double amount,

    /// orderId
    @JsonKey(name: OrderShippingMethodAdjustment.orderIdKey)
    required String orderId,

    /// description
    @JsonKey(name: OrderShippingMethodAdjustment.descriptionKey)
    required String description,

    /// promotionId
    @JsonKey(name: OrderShippingMethodAdjustment.promotionIdKey)
    required String promotionId,

    /// providerId
    @JsonKey(name: OrderShippingMethodAdjustment.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: OrderShippingMethodAdjustment.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderShippingMethodAdjustment.updatedAtKey)
    required DateTime updatedAt,
  }) = _OrderShippingMethodAdjustment;

  factory OrderShippingMethodAdjustment.fromJson(Map<String, dynamic> json) =>
      _$OrderShippingMethodAdjustmentFromJson(json);

  static const String shippingMethodKey = r'shipping_method';

  static const String shippingMethodIdKey = r'shipping_method_id';

  static const String idKey = r'id';

  static const String codeKey = r'code';

  static const String amountKey = r'amount';

  static const String orderIdKey = r'order_id';

  static const String descriptionKey = r'description';

  static const String promotionIdKey = r'promotion_id';

  static const String providerIdKey = r'provider_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
