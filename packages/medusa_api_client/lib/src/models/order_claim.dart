/// OrderClaim
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The claim's ID.",
///             "title": "id"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order associated with the claim.",
///             "title": "order_id"
///         },
///         "claim_items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseClaimItem"
///             },
///             "description": "The order items targetted by the claim."
///         },
///         "additional_items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseClaimItem"
///             },
///             "description": "The outbound or new items of the claim."
///         },
///         "return": {
///             "type": "object"
///         },
///         "return_id": {
///             "type": "string",
///             "description": "The ID of the associated return.",
///             "title": "return_id"
///         },
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether the customer should be notified about changes in the claim.",
///             "title": "no_notification"
///         },
///         "refund_amount": {
///             "type": "number",
///             "description": "The amount to be refunded.",
///             "title": "refund_amount"
///         },
///         "display_id": {
///             "type": "number",
///             "description": "The claim's display ID.",
///             "title": "display_id"
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderShippingMethod"
///             },
///             "description": "The claim's shipping methods."
///         },
///         "transactions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderTransaction"
///             },
///             "description": "The claim's transactions."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The claim's metadata, used to store custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The claim's creation date.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The claim's update date.",
///             "title": "updated_at"
///         },
///         "type": {
///             "enum": [
///                 "replace",
///                 "refund"
///             ],
///             "type": "string",
///             "description": "The claim's type."
///         },
///         "order": {
///             "$ref": "#/components/schemas/Order"
///         },
///         "order_version": {
///             "type": "number",
///             "description": "The claim's order version.",
///             "title": "order_version"
///         },
///         "raw_refund_amount": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The claim's raw refund amount.",
///                     "title": "raw_refund_amount"
///                 },
///                 {
///                     "type": "number",
///                     "description": "The claim's raw refund amount.",
///                     "title": "raw_refund_amount"
///                 },
///                 {
///                     "type": "string",
///                     "description": "The claim's raw refund amount.",
///                     "title": "raw_refund_amount"
///                 },
///                 {
///                     "type": "number",
///                     "description": "The claim's raw refund amount.",
///                     "title": "raw_refund_amount"
///                 }
///             ]
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the claim.",
///             "title": "created_by"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the claim was deleted.",
///             "title": "deleted_at"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the claim was canceled.",
///             "title": "canceled_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "type",
///         "order_id",
///         "order_version",
///         "display_id",
///         "claim_items",
///         "additional_items",
///         "metadata"
///     ],
///     "description": "The order change's claim."
/// }
library;

import 'exports.dart';
part 'order_claim.freezed.dart';
part 'order_claim.g.dart'; // OrderClaim

@freezed
abstract class OrderClaim with _$OrderClaim {
  const OrderClaim._();

  @jsonSerializable
  const factory OrderClaim({
    /// id
    @JsonKey(name: OrderClaim.idKey) required String id,

    /// orderId
    @JsonKey(name: OrderClaim.orderIdKey) required String orderId,

    /// claimItems
    @JsonKey(name: OrderClaim.claimItemsKey)
    required List<BaseClaimItem> claimItems,

    /// additionalItems
    @JsonKey(name: OrderClaim.additionalItemsKey)
    required List<BaseClaimItem> additionalItems,

    /// returnAA
    @JsonKey(name: OrderClaim.returnAAKey)
    required Map<String, dynamic> returnAA,

    /// returnId
    @JsonKey(name: OrderClaim.returnIdKey) required String returnId,

    /// noNotification
    @JsonKey(name: OrderClaim.noNotificationKey) required bool noNotification,

    /// refundAmount
    @JsonKey(name: OrderClaim.refundAmountKey) required double refundAmount,

    /// displayId
    @JsonKey(name: OrderClaim.displayIdKey) required double displayId,

    /// shippingMethods
    @JsonKey(name: OrderClaim.shippingMethodsKey)
    required List<OrderShippingMethod> shippingMethods,

    /// transactions
    @JsonKey(name: OrderClaim.transactionsKey)
    required List<OrderTransaction> transactions,

    /// metadata
    @JsonKey(name: OrderClaim.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: OrderClaim.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderClaim.updatedAtKey) required DateTime updatedAt,

    /// type
    @JsonKey(name: OrderClaim.typeKey) required NullEnum type,

    /// order
    @JsonKey(name: OrderClaim.orderKey) required Order order,

    /// orderVersion
    @JsonKey(name: OrderClaim.orderVersionKey) required double orderVersion,

    /// rawRefundAmount
    @JsonKey(name: OrderClaim.rawRefundAmountKey)
    required dynamic rawRefundAmount,

    /// createdBy
    @JsonKey(name: OrderClaim.createdByKey) required String createdBy,

    /// deletedAt
    @JsonKey(name: OrderClaim.deletedAtKey) required DateTime deletedAt,

    /// canceledAt
    @JsonKey(name: OrderClaim.canceledAtKey) required DateTime canceledAt,
  }) = _OrderClaim;

  factory OrderClaim.fromJson(Map<String, dynamic> json) =>
      _$OrderClaimFromJson(json);

  static const String idKey = r'id';

  static const String orderIdKey = r'order_id';

  static const String claimItemsKey = r'claim_items';

  static const String additionalItemsKey = r'additional_items';

  static const String returnAAKey = r'return';

  static const String returnIdKey = r'return_id';

  static const String noNotificationKey = r'no_notification';

  static const String refundAmountKey = r'refund_amount';

  static const String displayIdKey = r'display_id';

  static const String shippingMethodsKey = r'shipping_methods';

  static const String transactionsKey = r'transactions';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String typeKey = r'type';

  static const String orderKey = r'order';

  static const String orderVersionKey = r'order_version';

  static const String rawRefundAmountKey = r'raw_refund_amount';

  static const String createdByKey = r'created_by';

  static const String deletedAtKey = r'deleted_at';

  static const String canceledAtKey = r'canceled_at';
}
