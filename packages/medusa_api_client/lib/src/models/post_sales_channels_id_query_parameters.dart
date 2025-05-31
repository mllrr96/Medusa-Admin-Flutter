/// PostSalesChannelsIdQueryParameters
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
part 'post_sales_channels_id_query_parameters.freezed.dart';
part 'post_sales_channels_id_query_parameters.g.dart'; // PostSalesChannelsIdQueryParameters

@freezed
abstract class PostSalesChannelsIdQueryParameters
    with _$PostSalesChannelsIdQueryParameters {
  const PostSalesChannelsIdQueryParameters._();

  @jsonSerializable
  const factory PostSalesChannelsIdQueryParameters({
    /// fields
    @JsonKey(name: PostSalesChannelsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostSalesChannelsIdQueryParameters;

  factory PostSalesChannelsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostSalesChannelsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
