/// AdminPriceList
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The price list's ID.",
///             "title": "id"
///         },
///         "title": {
///             "type": "string",
///             "description": "The price list's title.",
///             "title": "title"
///         },
///         "description": {
///             "type": "string",
///             "description": "The price list's description.",
///             "title": "description"
///         },
///         "rules": {
///             "type": "object",
///             "description": "The price list's rules."
///         },
///         "starts_at": {
///             "type": "string",
///             "description": "The date the price list starts.",
///             "title": "starts_at"
///         },
///         "ends_at": {
///             "type": "string",
///             "description": "The date the price list ends.",
///             "title": "ends_at"
///         },
///         "status": {
///             "enum": [
///                 "draft",
///                 "active"
///             ],
///             "type": "string",
///             "description": "The price list's status."
///         },
///         "type": {
///             "enum": [
///                 "sale",
///                 "override"
///             ],
///             "type": "string",
///             "description": "The price list's type."
///         },
///         "prices": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminPriceListPrice"
///             },
///             "description": "The price list's prices."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price list was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price list was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the price list was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "title",
///         "description",
///         "rules",
///         "starts_at",
///         "ends_at",
///         "status",
///         "type",
///         "prices",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The price list's details."
/// }
library;

import 'exports.dart';
part 'admin_price_list.freezed.dart';
part 'admin_price_list.g.dart'; // AdminPriceList

@freezed
abstract class AdminPriceList with _$AdminPriceList {
  const AdminPriceList._();

  @jsonSerializable
  const factory AdminPriceList({
    /// id
    @JsonKey(name: AdminPriceList.idKey) required String id,

    /// title
    @JsonKey(name: AdminPriceList.titleKey) required String title,

    /// description
    @JsonKey(name: AdminPriceList.descriptionKey) required String description,

    /// rules
    @JsonKey(name: AdminPriceList.rulesKey) required Map<String, dynamic> rules,

    /// startsAt
    @JsonKey(name: AdminPriceList.startsAtKey) required String startsAt,

    /// endsAt
    @JsonKey(name: AdminPriceList.endsAtKey) required String endsAt,

    /// status
    @JsonKey(name: AdminPriceList.statusKey) required NullEnum status,

    /// type
    @JsonKey(name: AdminPriceList.typeKey) required NullEnum type,

    /// prices
    @JsonKey(name: AdminPriceList.pricesKey)
    required List<AdminPriceListPrice> prices,

    /// createdAt
    @JsonKey(name: AdminPriceList.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminPriceList.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminPriceList.deletedAtKey) required DateTime deletedAt,
  }) = _AdminPriceList;

  factory AdminPriceList.fromJson(Map<String, dynamic> json) =>
      _$AdminPriceListFromJson(json);

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String descriptionKey = r'description';

  static const String rulesKey = r'rules';

  static const String startsAtKey = r'starts_at';

  static const String endsAtKey = r'ends_at';

  static const String statusKey = r'status';

  static const String typeKey = r'type';

  static const String pricesKey = r'prices';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
