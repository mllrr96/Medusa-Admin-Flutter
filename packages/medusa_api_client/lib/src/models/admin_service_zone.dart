/// AdminServiceZone
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The service zone's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The service zone's name.",
///             "title": "name"
///         },
///         "fulfillment_set_id": {
///             "type": "string",
///             "description": "The service zone's fulfillment set id.",
///             "title": "fulfillment_set_id"
///         },
///         "fulfillment_set": {
///             "type": "object"
///         },
///         "geo_zones": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminGeoZone"
///             },
///             "description": "The service zone's geo zones."
///         },
///         "shipping_options": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminShippingOption"
///             },
///             "description": "The service zone's shipping options."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The service zone's created at.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The service zone's updated at.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The service zone's deleted at.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "fulfillment_set_id",
///         "fulfillment_set",
///         "geo_zones",
///         "shipping_options",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The shipping option's service zone."
/// }
library admin_service_zone;

import 'exports.dart';
part 'admin_service_zone.freezed.dart';
part 'admin_service_zone.g.dart'; // AdminServiceZone

@freezed
abstract class AdminServiceZone with _$AdminServiceZone {
  const AdminServiceZone._();

  @jsonSerializable
  const factory AdminServiceZone({
    /// id
    @JsonKey(name: AdminServiceZone.idKey) required String id,

    /// name
    @JsonKey(name: AdminServiceZone.nameKey) required String name,

    /// fulfillmentSetId
    @JsonKey(name: AdminServiceZone.fulfillmentSetIdKey)
    required String fulfillmentSetId,

    /// fulfillmentSet
    @JsonKey(name: AdminServiceZone.fulfillmentSetKey)
    required Map<String, dynamic> fulfillmentSet,

    /// geoZones
    @JsonKey(name: AdminServiceZone.geoZonesKey)
    required List<AdminGeoZone> geoZones,

    /// shippingOptions
    @JsonKey(name: AdminServiceZone.shippingOptionsKey)
    required List<AdminShippingOption> shippingOptions,

    /// createdAt
    @JsonKey(name: AdminServiceZone.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminServiceZone.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminServiceZone.deletedAtKey) required DateTime deletedAt,
  }) = _AdminServiceZone;

  factory AdminServiceZone.fromJson(Map<String, dynamic> json) =>
      _$AdminServiceZoneFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String fulfillmentSetIdKey = r'fulfillment_set_id';

  static const String fulfillmentSetKey = r'fulfillment_set';

  static const String geoZonesKey = r'geo_zones';

  static const String shippingOptionsKey = r'shipping_options';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
