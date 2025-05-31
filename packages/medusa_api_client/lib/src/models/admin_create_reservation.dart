/// AdminCreateReservation
/// {
///     "properties": {
///         "line_item_id": {
///             "type": "string",
///             "description": "The ID of the line item this reservation is created for.",
///             "title": "line_item_id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the location the quantity is reserved from.",
///             "title": "location_id"
///         },
///         "inventory_item_id": {
///             "type": "string",
///             "description": "The ID of the inventory item associated with the line item's variant.",
///             "title": "inventory_item_id"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The reserved quantity.",
///             "title": "quantity"
///         },
///         "description": {
///             "type": "string",
///             "description": "The reservation's description.",
///             "title": "description"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The reservation's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "location_id",
///         "inventory_item_id",
///         "quantity"
///     ],
///     "description": "The reservation's details."
/// }
library admin_create_reservation;

import 'exports.dart';
part 'admin_create_reservation.freezed.dart';
part 'admin_create_reservation.g.dart'; // AdminCreateReservation

@freezed
abstract class AdminCreateReservation with _$AdminCreateReservation {
  const AdminCreateReservation._();

  @jsonSerializable
  const factory AdminCreateReservation({
    /// lineItemId
    @JsonKey(name: AdminCreateReservation.lineItemIdKey)
    required String lineItemId,

    /// locationId
    @JsonKey(name: AdminCreateReservation.locationIdKey)
    required String locationId,

    /// inventoryItemId
    @JsonKey(name: AdminCreateReservation.inventoryItemIdKey)
    required String inventoryItemId,

    /// quantity
    @JsonKey(name: AdminCreateReservation.quantityKey) required double quantity,

    /// description
    @JsonKey(name: AdminCreateReservation.descriptionKey)
    required String description,

    /// metadata
    @JsonKey(name: AdminCreateReservation.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateReservation;

  factory AdminCreateReservation.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateReservationFromJson(json);

  static const String lineItemIdKey = r'line_item_id';

  static const String locationIdKey = r'location_id';

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String quantityKey = r'quantity';

  static const String descriptionKey = r'description';

  static const String metadataKey = r'metadata';
}
