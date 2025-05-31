/// OrderChangeAction
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The action's ID.",
///             "title": "id"
///         },
///         "order_change_id": {
///             "type": "string",
///             "description": "The ID of the order change that the action belongs to.",
///             "title": "order_change_id"
///         },
///         "order_change": {
///             "type": "object"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order the associated change is for.",
///             "title": "order_id"
///         },
///         "return_id": {
///             "type": "string",
///             "description": "The ID of the associated return.",
///             "title": "return_id"
///         },
///         "claim_id": {
///             "type": "string",
///             "description": "The ID of the associated claim.",
///             "title": "claim_id"
///         },
///         "exchange_id": {
///             "type": "string",
///             "description": "The ID of the associated exchange.",
///             "title": "exchange_id"
///         },
///         "order": {
///             "$ref": "#/components/schemas/Order"
///         },
///         "reference": {
///             "enum": [
///                 "claim",
///                 "exchange",
///                 "return",
///                 "order_shipping_method"
///             ],
///             "type": "string",
///             "description": "The name of the table this action applies on.",
///             "title": "reference"
///         },
///         "reference_id": {
///             "type": "string",
///             "description": "The ID of the record in the referenced table.",
///             "title": "reference_id"
///         },
///         "action": {
///             "enum": [
///                 "CANCEL_RETURN_ITEM",
///                 "FULFILL_ITEM",
///                 "DELIVER_ITEM",
///                 "CANCEL_ITEM_FULFILLMENT",
///                 "ITEM_ADD",
///                 "ITEM_REMOVE",
///                 "ITEM_UPDATE",
///                 "RECEIVE_DAMAGED_RETURN_ITEM",
///                 "RECEIVE_RETURN_ITEM",
///                 "RETURN_ITEM",
///                 "SHIPPING_ADD",
///                 "SHIPPING_REMOVE",
///                 "SHIP_ITEM",
///                 "WRITE_OFF_ITEM",
///                 "REINSTATE_ITEM"
///             ],
///             "type": "string",
///             "description": "The applied action."
///         },
///         "details": {
///             "type": "object",
///             "description": "The action's details."
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "A note that's viewed only by admin users.",
///             "title": "internal_note"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the action was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the action was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "order_change_id",
///         "order_change",
///         "order_id",
///         "return_id",
///         "claim_id",
///         "exchange_id",
///         "order",
///         "reference",
///         "reference_id",
///         "action",
///         "details",
///         "internal_note",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The order change action's details."
/// }
library order_change_action;

import 'exports.dart';
part 'order_change_action.freezed.dart';
part 'order_change_action.g.dart'; // OrderChangeAction

@freezed
abstract class OrderChangeAction with _$OrderChangeAction {
  const OrderChangeAction._();

  @jsonSerializable
  const factory OrderChangeAction({
    /// id
    @JsonKey(name: OrderChangeAction.idKey) required String id,

    /// orderChangeId
    @JsonKey(name: OrderChangeAction.orderChangeIdKey)
    required String orderChangeId,

    /// orderChange
    @JsonKey(name: OrderChangeAction.orderChangeKey)
    required Map<String, dynamic> orderChange,

    /// orderId
    @JsonKey(name: OrderChangeAction.orderIdKey) required String orderId,

    /// returnId
    @JsonKey(name: OrderChangeAction.returnIdKey) required String returnId,

    /// claimId
    @JsonKey(name: OrderChangeAction.claimIdKey) required String claimId,

    /// exchangeId
    @JsonKey(name: OrderChangeAction.exchangeIdKey) required String exchangeId,

    /// order
    @JsonKey(name: OrderChangeAction.orderKey) required Order order,

    /// reference
    @JsonKey(name: OrderChangeAction.referenceKey)
    required ReferenceEnum reference,

    /// referenceId
    @JsonKey(name: OrderChangeAction.referenceIdKey)
    required String referenceId,

    /// action
    @JsonKey(name: OrderChangeAction.actionKey) required NullEnum action,

    /// details
    @JsonKey(name: OrderChangeAction.detailsKey)
    required Map<String, dynamic> details,

    /// internalNote
    @JsonKey(name: OrderChangeAction.internalNoteKey)
    required String internalNote,

    /// createdAt
    @JsonKey(name: OrderChangeAction.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderChangeAction.updatedAtKey) required DateTime updatedAt,
  }) = _OrderChangeAction;

  factory OrderChangeAction.fromJson(Map<String, dynamic> json) =>
      _$OrderChangeActionFromJson(json);

  static const String idKey = r'id';

  static const String orderChangeIdKey = r'order_change_id';

  static const String orderChangeKey = r'order_change';

  static const String orderIdKey = r'order_id';

  static const String returnIdKey = r'return_id';

  static const String claimIdKey = r'claim_id';

  static const String exchangeIdKey = r'exchange_id';

  static const String orderKey = r'order';

  static const String referenceKey = r'reference';

  static const String referenceIdKey = r'reference_id';

  static const String actionKey = r'action';

  static const String detailsKey = r'details';

  static const String internalNoteKey = r'internal_note';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
