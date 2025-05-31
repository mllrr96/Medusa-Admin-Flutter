/// BaseShippingMethodAdjustment
/// {
///     "properties": {
///         "shipping_method": {
///             "type": "object"
///         },
///         "shipping_method_id": {
///             "type": "string",
///             "description": "The ID of the shipping method the adjustment is applied on.",
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
///         "cart_id": {
///             "type": "string",
///             "description": "The ID of the associated cart.",
///             "title": "cart_id"
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
///         "cart_id",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The adjustment's details."
/// }
library;

import 'exports.dart';
part 'base_shipping_method_adjustment.freezed.dart';
part 'base_shipping_method_adjustment.g.dart'; // BaseShippingMethodAdjustment

@freezed
abstract class BaseShippingMethodAdjustment
    with _$BaseShippingMethodAdjustment {
  const BaseShippingMethodAdjustment._();

  @jsonSerializable
  const factory BaseShippingMethodAdjustment({
    /// shippingMethod
    @JsonKey(name: BaseShippingMethodAdjustment.shippingMethodKey)
    required Map<String, dynamic> shippingMethod,

    /// shippingMethodId
    @JsonKey(name: BaseShippingMethodAdjustment.shippingMethodIdKey)
    required String shippingMethodId,

    /// id
    @JsonKey(name: BaseShippingMethodAdjustment.idKey) required String id,

    /// code
    @JsonKey(name: BaseShippingMethodAdjustment.codeKey) required String code,

    /// amount
    @JsonKey(name: BaseShippingMethodAdjustment.amountKey)
    required double amount,

    /// cartId
    @JsonKey(name: BaseShippingMethodAdjustment.cartIdKey)
    required String cartId,

    /// description
    @JsonKey(name: BaseShippingMethodAdjustment.descriptionKey)
    required String description,

    /// promotionId
    @JsonKey(name: BaseShippingMethodAdjustment.promotionIdKey)
    required String promotionId,

    /// providerId
    @JsonKey(name: BaseShippingMethodAdjustment.providerIdKey)
    required String providerId,

    /// createdAt
    @JsonKey(name: BaseShippingMethodAdjustment.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseShippingMethodAdjustment.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseShippingMethodAdjustment;

  factory BaseShippingMethodAdjustment.fromJson(Map<String, dynamic> json) =>
      _$BaseShippingMethodAdjustmentFromJson(json);

  static const String shippingMethodKey = r'shipping_method';

  static const String shippingMethodIdKey = r'shipping_method_id';

  static const String idKey = r'id';

  static const String codeKey = r'code';

  static const String amountKey = r'amount';

  static const String cartIdKey = r'cart_id';

  static const String descriptionKey = r'description';

  static const String promotionIdKey = r'promotion_id';

  static const String providerIdKey = r'provider_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
