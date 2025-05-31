/// PostApiKeysIdSalesChannelsQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'post_api_keys_id_sales_channels_query_parameters.freezed.dart';
part 'post_api_keys_id_sales_channels_query_parameters.g.dart'; // PostApiKeysIdSalesChannelsQueryParameters

@freezed
abstract class PostApiKeysIdSalesChannelsQueryParameters
    with _$PostApiKeysIdSalesChannelsQueryParameters {
  const PostApiKeysIdSalesChannelsQueryParameters._();

  @jsonSerializable
  const factory PostApiKeysIdSalesChannelsQueryParameters({
    /// fields
    @JsonKey(name: PostApiKeysIdSalesChannelsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostApiKeysIdSalesChannelsQueryParameters;

  factory PostApiKeysIdSalesChannelsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostApiKeysIdSalesChannelsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
