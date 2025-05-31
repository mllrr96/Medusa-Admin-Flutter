/// BaseOrderShippingMethodAdjustment
/// {
///     "properties": {
///         "shipping_method": {
///             "type": "object"
///         },
///         "shipping_method_id": {
///             "type": "string",
///             "description": "The ID of the shipping method this adjustment applies on.",
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
///             "description": "The ID of the promotion applied by this adjustment.",
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
///     "description": "The adjustment's adjustments."
/// }
library;

import 'exports.dart';
part 'base_order_shipping_method_adjustment.freezed.dart';
part 'base_order_shipping_method_adjustment.g.dart'; // BaseOrderShippingMethodAdjustment

@freezed
abstract class BaseOrderShippingMethodAdjustment
    with _$BaseOrderShippingMethodAdjustment {
  const BaseOrderShippingMethodAdjustment._();

  @jsonSerializable
  const factory BaseOrderShippingMethodAdjustment({
    /// shippingMethod
    @JsonKey(name: BaseOrderShippingMethodAdjustment.shippingMethodKey)
    required Map<String, dynamic> shippingMethod,

    /// shippingMethodId
    @JsonKey(name: BaseOrderShippingMethodAdjustment.shippingMethodIdKey)
    required String shippingMethodId,

    /// id
    @JsonKey(name: BaseOrderShippingMethodAdjustment.idKey) required String id,

    /// code
    @JsonKey(name: BaseOrderShippingMethodAdjustment.codeKey)
    required String code,

    /// amount
    @JsonKey(name: BaseOrderShippingMethodAdjustment.amountKey)
    required double amount,

    /// orderId
    @JsonKey(name: BaseOrderShippingMethodAdjustment.orderIdKey)
    required String orderId,

    /// description
    @JsonKey(name: BaseOrderShippingMethodAdjustment.descriptionKey)
    required String description,

    /// promotionId
    @JsonKey(name: BaseOrderShippingMethodAdjustment.promotionIdKey)
    required String promotionId,

    /// providerId
    @JsonKey(name: BaseOrderShippingMethodAdjustment.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: BaseOrderShippingMethodAdjustment.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrderShippingMethodAdjustment.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseOrderShippingMethodAdjustment;

  factory BaseOrderShippingMethodAdjustment.fromJson(
    Map<String, dynamic> json,
  ) => _$BaseOrderShippingMethodAdjustmentFromJson(json);

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
