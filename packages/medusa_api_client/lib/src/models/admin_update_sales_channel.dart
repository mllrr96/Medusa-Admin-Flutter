/// AdminUpdateSalesChannel
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
///             "description": "The sales channel's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "description": "The properties to update in the sales channel."
/// }
library admin_update_sales_channel;

import 'exports.dart';
part 'admin_update_sales_channel.freezed.dart';
part 'admin_update_sales_channel.g.dart'; // AdminUpdateSalesChannel

@freezed
abstract class AdminUpdateSalesChannel with _$AdminUpdateSalesChannel {
  const AdminUpdateSalesChannel._();

  @jsonSerializable
  const factory AdminUpdateSalesChannel({
    /// name
    @JsonKey(name: AdminUpdateSalesChannel.nameKey) required String name,

    /// description
    @JsonKey(name: AdminUpdateSalesChannel.descriptionKey)
    required String description,

    /// isDisabled
    @JsonKey(name: AdminUpdateSalesChannel.isDisabledKey)
    required bool isDisabled,

    /// metadata
    @JsonKey(name: AdminUpdateSalesChannel.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminUpdateSalesChannel;

  factory AdminUpdateSalesChannel.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateSalesChannelFromJson(json);

  static const String nameKey = r'name';

  static const String descriptionKey = r'description';

  static const String isDisabledKey = r'is_disabled';

  static const String metadataKey = r'metadata';
}
