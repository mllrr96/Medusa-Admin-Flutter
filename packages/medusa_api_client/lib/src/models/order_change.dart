/// OrderChange
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The order change's ID.",
///             "title": "id"
///         },
///         "version": {
///             "type": "number",
///             "description": "The order change's version. This will be the order's version when the change is applied.",
///             "title": "version"
///         },
///         "change_type": {
///             "enum": [
///                 "return",
///                 "exchange",
///                 "claim",
///                 "edit"
///             ],
///             "type": "string",
///             "description": "The order change's type."
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order this change applies on.",
///             "title": "order_id"
///         },
///         "return_id": {
///             "type": "string",
///             "description": "The ID of the associated return.",
///             "title": "return_id"
///         },
///         "exchange_id": {
///             "type": "string",
///             "description": "The ID of the associated exchange.",
///             "title": "exchange_id"
///         },
///         "claim_id": {
///             "type": "string",
///             "description": "The ID of the associated claim.",
///             "title": "claim_id"
///         },
///         "order": {
///             "type": "object"
///         },
///         "return_order": {
///             "type": "object"
///         },
///         "exchange": {
///             "$ref": "#/components/schemas/OrderExchange"
///         },
///         "claim": {
///             "$ref": "#/components/schemas/OrderClaim"
///         },
///         "actions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderChangeAction"
///             },
///             "description": "The order change's actions."
///         },
///         "status": {
///             "enum": [
///                 "canceled",
///                 "requested",
///                 "pending",
///                 "confirmed",
///                 "declined"
///             ],
///             "type": "string",
///             "description": "The order change's status."
///         },
///         "requested_by": {
///             "type": "string",
///             "description": "The ID of the user that requested the change.",
///             "title": "requested_by"
///         },
///         "requested_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the order change was requested.",
///             "title": "requested_at"
///         },
///         "confirmed_by": {
///             "type": "string",
///             "description": "The ID of the user that confirmed the order change.",
///             "title": "confirmed_by"
///         },
///         "confirmed_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the order change was confirmed.",
///             "title": "confirmed_at"
///         },
///         "declined_by": {
///             "type": "string",
///             "description": "The ID of the user that declined the order change.",
///             "title": "declined_by"
///         },
///         "declined_reason": {
///             "type": "string",
///             "description": "The reason the order change was declined.",
///             "title": "declined_reason"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The order change's metadata, can hold custom key-value pairs."
///         },
///         "declined_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the order change was declined.",
///             "title": "declined_at"
///         },
///         "canceled_by": {
///             "type": "string",
///             "description": "The ID of the user that canceled the order change.",
///             "title": "canceled_by"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the order change was canceled.",
///             "title": "canceled_at"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the order change was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the order change was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "version",
///         "order_id",
///         "return_id",
///         "exchange_id",
///         "claim_id",
///         "order",
///         "return_order",
///         "exchange",
///         "claim",
///         "actions",
///         "status",
///         "requested_by",
///         "requested_at",
///         "confirmed_by",
///         "confirmed_at",
///         "declined_by",
///         "declined_reason",
///         "metadata",
///         "declined_at",
///         "canceled_by",
///         "canceled_at",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The order change's details."
/// }
library;

import 'exports.dart';
part 'order_change.freezed.dart';
part 'order_change.g.dart'; // OrderChange

@freezed
abstract class OrderChange with _$OrderChange {
  const OrderChange._();

  @jsonSerializable
  const factory OrderChange({
    /// id
    @JsonKey(name: OrderChange.idKey) required String id,

    /// version
    @JsonKey(name: OrderChange.versionKey) required double version,

    /// changeType
    @JsonKey(name: OrderChange.changeTypeKey) required NullEnum changeType,

    /// orderId
    @JsonKey(name: OrderChange.orderIdKey) required String orderId,

    /// returnId
    @JsonKey(name: OrderChange.returnIdKey) required String returnId,

    /// exchangeId
    @JsonKey(name: OrderChange.exchangeIdKey) required String exchangeId,

    /// claimId
    @JsonKey(name: OrderChange.claimIdKey) required String claimId,

    /// order
    @JsonKey(name: OrderChange.orderKey) required Map<String, dynamic> order,

    /// returnOrder
    @JsonKey(name: OrderChange.returnOrderKey)
    required Map<String, dynamic> returnOrder,

    /// exchange
    @JsonKey(name: OrderChange.exchangeKey) required OrderExchange exchange,

    /// claim
    @JsonKey(name: OrderChange.claimKey) required OrderClaim claim,

    /// actions
    @JsonKey(name: OrderChange.actionsKey)
    required List<OrderChangeAction> actions,

    /// status
    @JsonKey(name: OrderChange.statusKey) required NullEnum status,

    /// requestedBy
    @JsonKey(name: OrderChange.requestedByKey) required String requestedBy,

    /// requestedAt
    @JsonKey(name: OrderChange.requestedAtKey) required DateTime requestedAt,

    /// confirmedBy
    @JsonKey(name: OrderChange.confirmedByKey) required String confirmedBy,

    /// confirmedAt
    @JsonKey(name: OrderChange.confirmedAtKey) required DateTime confirmedAt,

    /// declinedBy
    @JsonKey(name: OrderChange.declinedByKey) required String declinedBy,

    /// declinedReason
    @JsonKey(name: OrderChange.declinedReasonKey)
    required String declinedReason,

    /// metadata
    @JsonKey(name: OrderChange.metadataKey)
    required Map<String, dynamic> metadata,

    /// declinedAt
    @JsonKey(name: OrderChange.declinedAtKey) required DateTime declinedAt,

    /// canceledBy
    @JsonKey(name: OrderChange.canceledByKey) required String canceledBy,

    /// canceledAt
    @JsonKey(name: OrderChange.canceledAtKey) required DateTime canceledAt,

    /// createdAt
    @JsonKey(name: OrderChange.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderChange.updatedAtKey) required DateTime updatedAt,
  }) = _OrderChange;

  factory OrderChange.fromJson(Map<String, dynamic> json) =>
      _$OrderChangeFromJson(json);

  static const String idKey = r'id';

  static const String versionKey = r'version';

  static const String changeTypeKey = r'change_type';

  static const String orderIdKey = r'order_id';

  static const String returnIdKey = r'return_id';

  static const String exchangeIdKey = r'exchange_id';

  static const String claimIdKey = r'claim_id';

  static const String orderKey = r'order';

  static const String returnOrderKey = r'return_order';

  static const String exchangeKey = r'exchange';

  static const String claimKey = r'claim';

  static const String actionsKey = r'actions';

  static const String statusKey = r'status';

  static const String requestedByKey = r'requested_by';

  static const String requestedAtKey = r'requested_at';

  static const String confirmedByKey = r'confirmed_by';

  static const String confirmedAtKey = r'confirmed_at';

  static const String declinedByKey = r'declined_by';

  static const String declinedReasonKey = r'declined_reason';

  static const String metadataKey = r'metadata';

  static const String declinedAtKey = r'declined_at';

  static const String canceledByKey = r'canceled_by';

  static const String canceledAtKey = r'canceled_at';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
