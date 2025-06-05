/// AdminFulfillmentSet
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The fulfillment set's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The fulfillment set's name.",
///             "title": "name"
///         },
///         "type": {
///             "type": "string",
///             "description": "The fulfillment set's type.",
///             "title": "type"
///         },
///         "location": {
///             "$ref": "#/components/schemas/AdminStockLocation"
///         },
///         "service_zones": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminServiceZone"
///             },
///             "description": "The fulfillment set's service zones."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The fulfillment set's created at.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The fulfillment set's updated at.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The fulfillment set's deleted at.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "type",
///         "location",
///         "service_zones",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The service zone's fulfillment set."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment_set.freezed.dart';
part 'admin_fulfillment_set.g.dart'; // AdminFulfillmentSet

@freezed
abstract class AdminFulfillmentSet with _$AdminFulfillmentSet {
  const AdminFulfillmentSet._();

  @jsonSerializable
  const factory AdminFulfillmentSet({
    /// id
    @JsonKey(name: AdminFulfillmentSet.idKey) required String id,

    /// name
    @JsonKey(name: AdminFulfillmentSet.nameKey) required String name,

    /// type
    @JsonKey(name: AdminFulfillmentSet.typeKey) required String type,

    /// location
    @JsonKey(name: AdminFulfillmentSet.locationKey)
    required AdminStockLocation location,

    /// serviceZones
    @JsonKey(name: AdminFulfillmentSet.serviceZonesKey)
    required List<AdminServiceZone> serviceZones,

    /// createdAt
    @JsonKey(name: AdminFulfillmentSet.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminFulfillmentSet.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminFulfillmentSet.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminFulfillmentSet;

  factory AdminFulfillmentSet.fromJson(Map<String, dynamic> json) =>
      _$AdminFulfillmentSetFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String typeKey = r'type';

  static const String locationKey = r'location';

  static const String serviceZonesKey = r'service_zones';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
