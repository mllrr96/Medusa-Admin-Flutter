/// Return
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The return's ID.",
///             "title": "id"
///         },
///         "status": {
///             "enum": [
///                 "canceled",
///                 "requested",
///                 "received",
///                 "partially_received"
///             ],
///             "type": "string",
///             "description": "The return's status."
///         },
///         "refund_amount": {
///             "type": "number",
///             "description": "The amount refunded by this return.",
///             "title": "refund_amount"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the associated order.",
///             "title": "order_id"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderReturnItem"
///             },
///             "description": "The return's items."
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderShippingMethod"
///             },
///             "description": "The return's shipping methods."
///         },
///         "transactions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderTransaction"
///             },
///             "description": "The return's transactions."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The return's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return was updated.",
///             "title": "updated_at"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return was canceled.",
///             "title": "canceled_at"
///         },
///         "raw_refund_amount": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The return order's raw refund amount.",
///                     "title": "raw_refund_amount"
///                 },
///                 {
///                     "type": "number",
///                     "description": "The return order's raw refund amount.",
///                     "title": "raw_refund_amount"
///                 },
///                 {
///                     "type": "string",
///                     "description": "The return order's raw refund amount.",
///                     "title": "raw_refund_amount"
///                 },
///                 {
///                     "type": "number",
///                     "description": "The return order's raw refund amount.",
///                     "title": "raw_refund_amount"
///                 }
///             ]
///         },
///         "order": {
///             "$ref": "#/components/schemas/Order"
///         },
///         "exchange_id": {
///             "type": "string",
///             "description": "The ID of the exchange this return belongs to, if any.",
///             "title": "exchange_id"
///         },
///         "exchange": {
///             "type": "object"
///         },
///         "claim_id": {
///             "type": "string",
///             "description": "The ID of the claim this return belongs to, if any.",
///             "title": "claim_id"
///         },
///         "claim": {
///             "$ref": "#/components/schemas/OrderClaim"
///         },
///         "display_id": {
///             "type": "number",
///             "description": "The return order's display ID.",
///             "title": "display_id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the stock location the items are returned to.",
///             "title": "location_id"
///         },
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether to notify the customer about changes in the return.",
///             "title": "no_notification"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the return.",
///             "title": "created_by"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return was deleted.",
///             "title": "deleted_at"
///         },
///         "requested_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return was requested.",
///             "title": "requested_at"
///         },
///         "received_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return was received.",
///             "title": "received_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "status",
///         "order_id",
///         "items",
///         "display_id",
///         "metadata"
///     ],
///     "description": "The return's details."
/// }
library;

import 'exports.dart';
part 'return_aa.freezed.dart';
part 'return_aa.g.dart'; // ReturnAA

@freezed
abstract class ReturnAA with _$ReturnAA {
  const ReturnAA._();

  @jsonSerializable
  const factory ReturnAA({
    /// id
    @JsonKey(name: ReturnAA.idKey) required String id,

    /// status
    @JsonKey(name: ReturnAA.statusKey) required NullEnum status,

    /// refundAmount
    @JsonKey(name: ReturnAA.refundAmountKey) required double refundAmount,

    /// orderId
    @JsonKey(name: ReturnAA.orderIdKey) required String orderId,

    /// items
    @JsonKey(name: ReturnAA.itemsKey) required List<OrderReturnItem> items,

    /// shippingMethods
    @JsonKey(name: ReturnAA.shippingMethodsKey)
    required List<OrderShippingMethod> shippingMethods,

    /// transactions
    @JsonKey(name: ReturnAA.transactionsKey)
    required List<OrderTransaction> transactions,

    /// metadata
    @JsonKey(name: ReturnAA.metadataKey) required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: ReturnAA.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: ReturnAA.updatedAtKey) required DateTime updatedAt,

    /// canceledAt
    @JsonKey(name: ReturnAA.canceledAtKey) required DateTime canceledAt,

    /// rawRefundAmount
    @JsonKey(name: ReturnAA.rawRefundAmountKey)
    required dynamic rawRefundAmount,

    /// order
    @JsonKey(name: ReturnAA.orderKey) required Order order,

    /// exchangeId
    @JsonKey(name: ReturnAA.exchangeIdKey) required String exchangeId,

    /// exchange
    @JsonKey(name: ReturnAA.exchangeKey) required Map<String, dynamic> exchange,

    /// claimId
    @JsonKey(name: ReturnAA.claimIdKey) required String claimId,

    /// claim
    @JsonKey(name: ReturnAA.claimKey) required OrderClaim claim,

    /// displayId
    @JsonKey(name: ReturnAA.displayIdKey) required double displayId,

    /// locationId
    @JsonKey(name: ReturnAA.locationIdKey) required String locationId,

    /// noNotification
    @JsonKey(name: ReturnAA.noNotificationKey) required bool noNotification,

    /// createdBy
    @JsonKey(name: ReturnAA.createdByKey) required String createdBy,

    /// deletedAt
    @JsonKey(name: ReturnAA.deletedAtKey) required DateTime deletedAt,

    /// requestedAt
    @JsonKey(name: ReturnAA.requestedAtKey) required DateTime requestedAt,

    /// receivedAt
    @JsonKey(name: ReturnAA.receivedAtKey) required DateTime receivedAt,
  }) = _ReturnAA;

  factory ReturnAA.fromJson(Map<String, dynamic> json) =>
      _$ReturnAAFromJson(json);

  static const String idKey = r'id';

  static const String statusKey = r'status';

  static const String refundAmountKey = r'refund_amount';

  static const String orderIdKey = r'order_id';

  static const String itemsKey = r'items';

  static const String shippingMethodsKey = r'shipping_methods';

  static const String transactionsKey = r'transactions';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String canceledAtKey = r'canceled_at';

  static const String rawRefundAmountKey = r'raw_refund_amount';

  static const String orderKey = r'order';

  static const String exchangeIdKey = r'exchange_id';

  static const String exchangeKey = r'exchange';

  static const String claimIdKey = r'claim_id';

  static const String claimKey = r'claim';

  static const String displayIdKey = r'display_id';

  static const String locationIdKey = r'location_id';

  static const String noNotificationKey = r'no_notification';

  static const String createdByKey = r'created_by';

  static const String deletedAtKey = r'deleted_at';

  static const String requestedAtKey = r'requested_at';

  static const String receivedAtKey = r'received_at';
}
