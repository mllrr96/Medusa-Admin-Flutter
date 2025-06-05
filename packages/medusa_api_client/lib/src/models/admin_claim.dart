/// AdminClaim
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
///             "$ref": "#/components/schemas/AdminReturn"
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
///                 "$ref": "#/components/schemas/AdminOrderShippingMethod"
///             },
///             "description": "The claim's shipping methods."
///         },
///         "transactions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderTransaction"
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
///         "order": {
///             "$ref": "#/components/schemas/AdminOrder"
///         },
///         "type": {
///             "enum": [
///                 "replace",
///                 "refund"
///             ],
///             "type": "string",
///             "description": "The claim's type."
///         },
///         "order_version": {
///             "type": "string",
///             "description": "The version of the order when the claim is applied.",
///             "title": "order_version"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the claim.",
///             "title": "created_by"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the claim was canceled.",
///             "title": "canceled_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the claim was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order",
///         "return",
///         "id",
///         "type",
///         "order_id",
///         "display_id",
///         "order_version",
///         "created_at",
///         "updated_at",
///         "canceled_at",
///         "additional_items",
///         "claim_items"
///     ],
///     "description": "The claim's details."
/// }
library;

import 'exports.dart';
part 'admin_claim.freezed.dart';
part 'admin_claim.g.dart'; // AdminClaim

@freezed
abstract class AdminClaim with _$AdminClaim {
  const AdminClaim._();

  @jsonSerializable
  const factory AdminClaim({
    /// id
    @JsonKey(name: AdminClaim.idKey) required String id,

    /// orderId
    @JsonKey(name: AdminClaim.orderIdKey) required String orderId,

    /// claimItems
    @JsonKey(name: AdminClaim.claimItemsKey)
    required List<BaseClaimItem> claimItems,

    /// additionalItems
    @JsonKey(name: AdminClaim.additionalItemsKey)
    required List<BaseClaimItem> additionalItems,

    /// returnAA
    @JsonKey(name: AdminClaim.returnAAKey) required AdminReturn returnAA,

    /// returnId
    @JsonKey(name: AdminClaim.returnIdKey) required String returnId,

    /// noNotification
    @JsonKey(name: AdminClaim.noNotificationKey) required bool noNotification,

    /// refundAmount
    @JsonKey(name: AdminClaim.refundAmountKey) required double refundAmount,

    /// displayId
    @JsonKey(name: AdminClaim.displayIdKey) required double displayId,

    /// shippingMethods
    @JsonKey(name: AdminClaim.shippingMethodsKey)
    required List<AdminOrderShippingMethod> shippingMethods,

    /// transactions
    @JsonKey(name: AdminClaim.transactionsKey)
    required List<BaseOrderTransaction> transactions,

    /// metadata
    @JsonKey(name: AdminClaim.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminClaim.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminClaim.updatedAtKey) required DateTime updatedAt,

    /// order
    @JsonKey(name: AdminClaim.orderKey) required AdminOrder order,

    /// type
    @JsonKey(name: AdminClaim.typeKey) required NullEnum type,

    /// orderVersion
    @JsonKey(name: AdminClaim.orderVersionKey) required String orderVersion,

    /// createdBy
    @JsonKey(name: AdminClaim.createdByKey) required String createdBy,

    /// canceledAt
    @JsonKey(name: AdminClaim.canceledAtKey) required DateTime canceledAt,

    /// deletedAt
    @JsonKey(name: AdminClaim.deletedAtKey) required DateTime deletedAt,
  }) = _AdminClaim;

  factory AdminClaim.fromJson(Map<String, dynamic> json) =>
      _$AdminClaimFromJson(json);

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

  static const String orderKey = r'order';

  static const String typeKey = r'type';

  static const String orderVersionKey = r'order_version';

  static const String createdByKey = r'created_by';

  static const String canceledAtKey = r'canceled_at';

  static const String deletedAtKey = r'deleted_at';
}
