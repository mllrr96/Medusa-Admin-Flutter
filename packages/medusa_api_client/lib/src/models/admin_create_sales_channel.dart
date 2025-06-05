/// AdminCreateSalesChannel
/// {
///     "properties": {
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
///             "description": "The sales channel's metadata, used to store custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "name"
///     ],
///     "description": "The sales channel's details."
/// }
library;

import 'exports.dart';
part 'admin_create_sales_channel.freezed.dart';
part 'admin_create_sales_channel.g.dart'; // AdminCreateSalesChannel

@freezed
abstract class AdminCreateSalesChannel with _$AdminCreateSalesChannel {
  const AdminCreateSalesChannel._();

  @jsonSerializable
  const factory AdminCreateSalesChannel({
    /// name
    @JsonKey(name: AdminCreateSalesChannel.nameKey) required String name,

    /// description
    @JsonKey(name: AdminCreateSalesChannel.descriptionKey)
    required String description,

    /// isDisabled
    @JsonKey(name: AdminCreateSalesChannel.isDisabledKey)
    required bool isDisabled,

    /// metadata
    @JsonKey(name: AdminCreateSalesChannel.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateSalesChannel;

  factory AdminCreateSalesChannel.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateSalesChannelFromJson(json);

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String isDisabledKey = r'is_disabled';

  static const String metadataKey = r'metadata';
}
