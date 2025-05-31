/// AdminTransferOrder
/// {
///     "properties": {
///         "customer_id": {
///             "type": "string",
///             "description": "The ID of the customer to transfer the order to.",
///             "title": "customer_id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The description of the order transfer, which can be shown to the customer receiving the order transfer request.",
///             "title": "description"
///         },
///         "internal_note": {
///             "type": "string",
///             "description": "An internal note viewable only by admin users.",
///             "title": "internal_note"
///         }
///     },
///     "type": "object",
///     "required": [
///         "customer_id"
///     ],
///     "description": "The details of the request to transfer the order."
/// }
library admin_transfer_order;

import 'exports.dart';
part 'admin_transfer_order.freezed.dart';
part 'admin_transfer_order.g.dart'; // AdminTransferOrder

@freezed
abstract class AdminTransferOrder with _$AdminTransferOrder {
  const AdminTransferOrder._();

  @jsonSerializable
  const factory AdminTransferOrder({
    /// customerId
    @JsonKey(name: AdminTransferOrder.customerIdKey) required String customerId,

    /// description
    @JsonKey(name: AdminTransferOrder.descriptionKey)
    required String description,

    /// internalNote
    @JsonKey(name: AdminTransferOrder.internalNoteKey)
    required String internalNote,
  }) = _AdminTransferOrder;

  factory AdminTransferOrder.fromJson(Map<String, dynamic> json) =>
      _$AdminTransferOrderFromJson(json);

  static const String customerIdKey = r'customer_id';

  static const String descriptionKey = r'description';

  static const String internalNoteKey = r'internal_note';
}
