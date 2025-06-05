/// AdminCreatePriceList
/// {
///     "properties": {
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
///         "starts_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date and time the price list starts at.",
///             "title": "starts_at"
///         },
///         "ends_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date and time the price list ends at.",
///             "title": "ends_at"
///         },
///         "status": {
///             "enum": [
///                 "active",
///                 "draft"
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
///         "rules": {
///             "type": "object",
///             "description": "The price list's rules."
///         },
///         "prices": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "A price's details."
///             },
///             "description": "The price list's prices."
///         }
///     },
///     "type": "object",
///     "required": [
///         "title",
///         "description"
///     ],
///     "description": "The price list's details."
/// }
library;

import 'exports.dart';
part 'admin_create_price_list.freezed.dart';
part 'admin_create_price_list.g.dart'; // AdminCreatePriceList

@freezed
abstract class AdminCreatePriceList with _$AdminCreatePriceList {
  const AdminCreatePriceList._();

  @jsonSerializable
  const factory AdminCreatePriceList({
    /// title
    @JsonKey(name: AdminCreatePriceList.titleKey) required String title,

    /// description
    @JsonKey(name: AdminCreatePriceList.descriptionKey)
    required String description,

    /// startsAt
    @JsonKey(name: AdminCreatePriceList.startsAtKey) required DateTime startsAt,

    /// endsAt
    @JsonKey(name: AdminCreatePriceList.endsAtKey) required DateTime endsAt,

    /// status
    @JsonKey(name: AdminCreatePriceList.statusKey) required NullEnum status,

    /// type
    @JsonKey(name: AdminCreatePriceList.typeKey) required NullEnum type,

    /// rules
    @JsonKey(name: AdminCreatePriceList.rulesKey)
    required Map<String, dynamic> rules,

    /// prices
    @JsonKey(name: AdminCreatePriceList.pricesKey)
    required List<Map<String, dynamic>> prices,
  }) = _AdminCreatePriceList;

  factory AdminCreatePriceList.fromJson(Map<String, dynamic> json) =>
      _$AdminCreatePriceListFromJson(json);

  static const String titleKey = r'title';

  static const String descriptionKey = r'description';

  static const String startsAtKey = r'starts_at';

  static const String endsAtKey = r'ends_at';

  static const String statusKey = r'status';

  static const String typeKey = r'type';

  static const String rulesKey = r'rules';

  static const String pricesKey = r'prices';
}
