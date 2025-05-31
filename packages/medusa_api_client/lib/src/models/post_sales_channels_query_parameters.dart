/// PostSalesChannelsQueryParameters
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
part 'post_sales_channels_query_parameters.freezed.dart';
part 'post_sales_channels_query_parameters.g.dart'; // PostSalesChannelsQueryParameters

@freezed
abstract class PostSalesChannelsQueryParameters
    with _$PostSalesChannelsQueryParameters {
  const PostSalesChannelsQueryParameters._();

  @jsonSerializable
  const factory PostSalesChannelsQueryParameters({
    /// fields
    @JsonKey(name: PostSalesChannelsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostSalesChannelsQueryParameters;

  factory PostSalesChannelsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostSalesChannelsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
