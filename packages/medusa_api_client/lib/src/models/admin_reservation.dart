/// AdminReservation
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The reservation's ID.",
///             "title": "id"
///         },
///         "line_item_id": {
///             "type": "string",
///             "description": "The ID of the line item this reservation is for.",
///             "title": "line_item_id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the location the quantity is reserved from.",
///             "title": "location_id"
///         },
///         "quantity": {
///             "type": "number",
///             "description": "The reservation's quantity.",
///             "title": "quantity"
///         },
///         "external_id": {
///             "type": "string",
///             "description": "An ID in an external system",
///             "title": "external_id"
///         },
///         "description": {
///             "type": "string",
///             "description": "The reservation's description.",
///             "title": "description"
///         },
///         "inventory_item_id": {
///             "type": "string",
///             "description": "The ID of the inventory item this reservation is associated with.",
///             "title": "inventory_item_id"
///         },
///         "inventory_item": {
///             "$ref": "#/components/schemas/AdminInventoryItem"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The reservation's metadata, can hold custom key-value pairs."
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created this reservation.",
///             "title": "created_by"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date this reservation was deleted.",
///             "title": "deleted_at"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date this reservation was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date this reservation was updated.",
///             "title": "updated_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "line_item_id",
///         "location_id",
///         "quantity",
///         "external_id",
///         "description",
///         "inventory_item_id"
///     ],
///     "description": "The reservation's details."
/// }
library admin_reservation;

import 'exports.dart';
part 'admin_reservation.freezed.dart';
part 'admin_reservation.g.dart'; // AdminReservation

@freezed
abstract class AdminReservation with _$AdminReservation {
  const AdminReservation._();

  @jsonSerializable
  const factory AdminReservation({
    /// id
    @JsonKey(name: AdminReservation.idKey) required String id,

    /// lineItemId
    @JsonKey(name: AdminReservation.lineItemIdKey) required String lineItemId,

    /// locationId
    @JsonKey(name: AdminReservation.locationIdKey) required String locationId,

    /// quantity
    @JsonKey(name: AdminReservation.quantityKey) required double quantity,

    /// externalId
    @JsonKey(name: AdminReservation.externalIdKey) required String externalId,

    /// description
    @JsonKey(name: AdminReservation.descriptionKey) required String description,

    /// inventoryItemId
    @JsonKey(name: AdminReservation.inventoryItemIdKey)
    required String inventoryItemId,

    /// inventoryItem
    @JsonKey(name: AdminReservation.inventoryItemKey)
    required AdminInventoryItem inventoryItem,

    /// metadata
    @JsonKey(name: AdminReservation.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdBy
    @JsonKey(name: AdminReservation.createdByKey) required String createdBy,

    /// deletedAt
    @JsonKey(name: AdminReservation.deletedAtKey) required DateTime deletedAt,

    /// createdAt
    @JsonKey(name: AdminReservation.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminReservation.updatedAtKey) required DateTime updatedAt,
  }) = _AdminReservation;

  factory AdminReservation.fromJson(Map<String, dynamic> json) =>
      _$AdminReservationFromJson(json);

  static const String idKey = r'id';

  static const String lineItemIdKey = r'line_item_id';

  static const String locationIdKey = r'location_id';

  static const String quantityKey = r'quantity';

  static const String externalIdKey = r'external_id';

  static const String descriptionKey = r'description';

  static const String inventoryItemIdKey = r'inventory_item_id';

  static const String inventoryItemKey = r'inventory_item';

  static const String metadataKey = r'metadata';

  static const String createdByKey = r'created_by';

  static const String deletedAtKey = r'deleted_at';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
