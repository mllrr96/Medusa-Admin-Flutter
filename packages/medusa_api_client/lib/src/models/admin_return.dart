/// AdminReturn
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
///                 "$ref": "#/components/schemas/AdminReturnItem"
///             },
///             "description": "The return's items."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return was created.",
///             "title": "created_at"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return was canceled.",
///             "title": "canceled_at"
///         },
///         "exchange_id": {
///             "type": "string",
///             "description": "The return's exchange id.",
///             "title": "exchange_id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The return's location id.",
///             "title": "location_id"
///         },
///         "claim_id": {
///             "type": "string",
///             "description": "The return's claim id.",
///             "title": "claim_id"
///         },
///         "order_version": {
///             "type": "number",
///             "description": "The return's order version.",
///             "title": "order_version"
///         },
///         "display_id": {
///             "type": "number",
///             "description": "The return's display id.",
///             "title": "display_id"
///         },
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether the customer should receive notifications about the return's updates.",
///             "title": "no_notification"
///         },
///         "received_at": {
///             "type": "string",
///             "description": "The date the return was received.",
///             "title": "received_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "items",
///         "id",
///         "order_id",
///         "order_version",
///         "display_id",
///         "received_at",
///         "created_at",
///         "canceled_at"
///     ],
///     "description": "The return's details."
/// }
library admin_return;

import 'exports.dart';
part 'admin_return.freezed.dart';
part 'admin_return.g.dart'; // AdminReturn

@freezed
abstract class AdminReturn with _$AdminReturn {
  const AdminReturn._();

  @jsonSerializable
  const factory AdminReturn({
    /// id
    @JsonKey(name: AdminReturn.idKey) required String id,

    /// status
    @JsonKey(name: AdminReturn.statusKey) required NullEnum status,

    /// refundAmount
    @JsonKey(name: AdminReturn.refundAmountKey) required double refundAmount,

    /// orderId
    @JsonKey(name: AdminReturn.orderIdKey) required String orderId,

    /// items
    @JsonKey(name: AdminReturn.itemsKey) required List<AdminReturnItem> items,

    /// createdAt
    @JsonKey(name: AdminReturn.createdAtKey) required DateTime createdAt,

    /// canceledAt
    @JsonKey(name: AdminReturn.canceledAtKey) required DateTime canceledAt,

    /// exchangeId
    @JsonKey(name: AdminReturn.exchangeIdKey) required String exchangeId,

    /// locationId
    @JsonKey(name: AdminReturn.locationIdKey) required String locationId,

    /// claimId
    @JsonKey(name: AdminReturn.claimIdKey) required String claimId,

    /// orderVersion
    @JsonKey(name: AdminReturn.orderVersionKey) required double orderVersion,

    /// displayId
    @JsonKey(name: AdminReturn.displayIdKey) required double displayId,

    /// noNotification
    @JsonKey(name: AdminReturn.noNotificationKey) required bool noNotification,

    /// receivedAt
    @JsonKey(name: AdminReturn.receivedAtKey) required String receivedAt,
  }) = _AdminReturn;

  factory AdminReturn.fromJson(Map<String, dynamic> json) =>
      _$AdminReturnFromJson(json);

  static const String idKey = r'id';

  static const String statusKey = r'status';

  static const String refundAmountKey = r'refund_amount';

  static const String orderIdKey = r'order_id';

  static const String itemsKey = r'items';

  static const String createdAtKey = r'created_at';

  static const String canceledAtKey = r'canceled_at';

  static const String exchangeIdKey = r'exchange_id';

  static const String locationIdKey = r'location_id';

  static const String claimIdKey = r'claim_id';

  static const String orderVersionKey = r'order_version';

  static const String displayIdKey = r'display_id';

  static const String noNotificationKey = r'no_notification';

  static const String receivedAtKey = r'received_at';
}
