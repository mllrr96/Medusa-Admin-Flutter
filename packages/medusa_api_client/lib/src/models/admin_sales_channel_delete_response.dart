/// AdminSalesChannelDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The sales channel's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "sales-channel",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the sales channel was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of deleting a sales channel."
/// }
library;

import 'exports.dart';
part 'admin_sales_channel_delete_response.freezed.dart';
part 'admin_sales_channel_delete_response.g.dart'; // AdminSalesChannelDeleteResponse

@freezed
abstract class AdminSalesChannelDeleteResponse
    with _$AdminSalesChannelDeleteResponse {
  const AdminSalesChannelDeleteResponse._();

  @jsonSerializable
  const factory AdminSalesChannelDeleteResponse({
    /// id
    @JsonKey(name: AdminSalesChannelDeleteResponse.idKey) required String id,

    /// object
    @Default('sales-channel')
    @JsonKey(name: AdminSalesChannelDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminSalesChannelDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminSalesChannelDeleteResponse;

  factory AdminSalesChannelDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminSalesChannelDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
