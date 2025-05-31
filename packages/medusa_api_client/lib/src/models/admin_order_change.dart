/// AdminOrderChange
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
///             "$ref": "#/components/schemas/AdminOrder"
///         },
///         "return_order": {
///             "$ref": "#/components/schemas/AdminReturn"
///         },
///         "exchange": {
///             "$ref": "#/components/schemas/AdminExchange"
///         },
///         "claim": {
///             "$ref": "#/components/schemas/AdminClaim"
///         },
///         "actions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminOrderChangeAction"
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
///         "order",
///         "claim",
///         "return_order",
///         "exchange",
///         "actions",
///         "status",
///         "id",
///         "version",
///         "metadata",
///         "created_at",
///         "updated_at",
///         "order_id",
///         "canceled_at",
///         "return_id",
///         "exchange_id",
///         "claim_id",
///         "requested_by",
///         "requested_at",
///         "confirmed_by",
///         "confirmed_at",
///         "declined_by",
///         "declined_reason",
///         "declined_at",
///         "canceled_by"
///     ],
///     "description": "The order change's details."
/// }
library admin_order_change;

import 'exports.dart';
part 'admin_order_change.freezed.dart';
part 'admin_order_change.g.dart'; // AdminOrderChange

@freezed
abstract class AdminOrderChange with _$AdminOrderChange {
  const AdminOrderChange._();

  @jsonSerializable
  const factory AdminOrderChange({
    /// id
    @JsonKey(name: AdminOrderChange.idKey) required String id,

    /// version
    @JsonKey(name: AdminOrderChange.versionKey) required double version,

    /// changeType
    @JsonKey(name: AdminOrderChange.changeTypeKey) required NullEnum changeType,

    /// orderId
    @JsonKey(name: AdminOrderChange.orderIdKey) required String orderId,

    /// returnId
    @JsonKey(name: AdminOrderChange.returnIdKey) required String returnId,

    /// exchangeId
    @JsonKey(name: AdminOrderChange.exchangeIdKey) required String exchangeId,

    /// claimId
    @JsonKey(name: AdminOrderChange.claimIdKey) required String claimId,

    /// order
    @JsonKey(name: AdminOrderChange.orderKey) required AdminOrder order,

    /// returnOrder
    @JsonKey(name: AdminOrderChange.returnOrderKey)
    required AdminReturn returnOrder,

    /// exchange
    @JsonKey(name: AdminOrderChange.exchangeKey)
    required AdminExchange exchange,

    /// claim
    @JsonKey(name: AdminOrderChange.claimKey) required AdminClaim claim,

    /// actions
    @JsonKey(name: AdminOrderChange.actionsKey)
    required List<AdminOrderChangeAction> actions,

    /// status
    @JsonKey(name: AdminOrderChange.statusKey) required NullEnum status,

    /// requestedBy
    @JsonKey(name: AdminOrderChange.requestedByKey) required String requestedBy,

    /// requestedAt
    @JsonKey(name: AdminOrderChange.requestedAtKey)
    required DateTime requestedAt,

    /// confirmedBy
    @JsonKey(name: AdminOrderChange.confirmedByKey) required String confirmedBy,

    /// confirmedAt
    @JsonKey(name: AdminOrderChange.confirmedAtKey)
    required DateTime confirmedAt,

    /// declinedBy
    @JsonKey(name: AdminOrderChange.declinedByKey) required String declinedBy,

    /// declinedReason
    @JsonKey(name: AdminOrderChange.declinedReasonKey)
    required String declinedReason,

    /// metadata
    @JsonKey(name: AdminOrderChange.metadataKey)
    required Map<String, dynamic> metadata,

    /// declinedAt
    @JsonKey(name: AdminOrderChange.declinedAtKey) required DateTime declinedAt,

    /// canceledBy
    @JsonKey(name: AdminOrderChange.canceledByKey) required String canceledBy,

    /// canceledAt
    @JsonKey(name: AdminOrderChange.canceledAtKey) required DateTime canceledAt,

    /// createdAt
    @JsonKey(name: AdminOrderChange.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminOrderChange.updatedAtKey) required DateTime updatedAt,
  }) = _AdminOrderChange;

  factory AdminOrderChange.fromJson(Map<String, dynamic> json) =>
      _$AdminOrderChangeFromJson(json);

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
