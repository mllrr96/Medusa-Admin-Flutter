/// AdminUpdatePriceList
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
///         }
///     },
///     "type": "object",
///     "description": "the details to update in a price list."
/// }
library;

import 'exports.dart';
part 'admin_update_price_list.freezed.dart';
part 'admin_update_price_list.g.dart'; // AdminUpdatePriceList

@freezed
abstract class AdminUpdatePriceList with _$AdminUpdatePriceList {
  const AdminUpdatePriceList._();

  @jsonSerializable
  const factory AdminUpdatePriceList({
    /// title
    @JsonKey(name: AdminUpdatePriceList.titleKey) required String title,

    /// description
    @JsonKey(name: AdminUpdatePriceList.descriptionKey)
    required String description,

    /// startsAt
    @JsonKey(name: AdminUpdatePriceList.startsAtKey) required String startsAt,

    /// endsAt
    @JsonKey(name: AdminUpdatePriceList.endsAtKey) required String endsAt,

    /// status
    @JsonKey(name: AdminUpdatePriceList.statusKey) required NullEnum status,

    /// type
    @JsonKey(name: AdminUpdatePriceList.typeKey) required NullEnum type,

    /// rules
    @JsonKey(name: AdminUpdatePriceList.rulesKey)
    required Map<String, dynamic> rules,
  }) = _AdminUpdatePriceList;

  factory AdminUpdatePriceList.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdatePriceListFromJson(json);

  static const String titleKey = r'title';

  static const String descriptionKey = r'description';

  static const String startsAtKey = r'starts_at';

  static const String endsAtKey = r'ends_at';

  static const String statusKey = r'status';

  static const String typeKey = r'type';

  static const String rulesKey = r'rules';
}
