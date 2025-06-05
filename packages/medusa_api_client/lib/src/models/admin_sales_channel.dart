/// AdminSalesChannel
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The sales channel's ID.",
///             "title": "id"
///         },
///         "name": {
///             "type": "string",
///             "description": "The sales channel's name.",
///             "title": "name"
///         },
///         "description": {
///             "type": "string",
///             "description": "The sales channel's description.",
///             "title": "description"
///         },
///         "is_disabled": {
///             "type": "boolean",
///             "description": "Whether the sales channel is disabled.",
///             "title": "is_disabled"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The sales channel's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the sales channel was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the sales channel was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the sales channel was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "name",
///         "description",
///         "is_disabled",
///         "metadata",
///         "created_at",
///         "updated_at",
///         "deleted_at"
///     ],
///     "description": "The sales channel's details."
/// }
library;

import 'exports.dart';
part 'admin_sales_channel.freezed.dart';
part 'admin_sales_channel.g.dart'; // AdminSalesChannel

@freezed
abstract class AdminSalesChannel with _$AdminSalesChannel {
  const AdminSalesChannel._();

  @jsonSerializable
  const factory AdminSalesChannel({
    /// id
    @JsonKey(name: AdminSalesChannel.idKey) required String id,

    /// name
    @JsonKey(name: AdminSalesChannel.nameKey) required String name,

    /// description
    @JsonKey(name: AdminSalesChannel.descriptionKey)
    required String description,

    /// isDisabled
    @JsonKey(name: AdminSalesChannel.isDisabledKey) required bool isDisabled,

    /// metadata
    @JsonKey(name: AdminSalesChannel.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminSalesChannel.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminSalesChannel.updatedAtKey) required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminSalesChannel.deletedAtKey) required DateTime deletedAt,
  }) = _AdminSalesChannel;

  factory AdminSalesChannel.fromJson(Map<String, dynamic> json) =>
      _$AdminSalesChannelFromJson(json);

  static const String idKey = r'id';

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String isDisabledKey = r'is_disabled';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
