/// PostPriceListsQueryParameters
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
part 'post_price_lists_query_parameters.freezed.dart';
part 'post_price_lists_query_parameters.g.dart'; // PostPriceListsQueryParameters

@freezed
abstract class PostPriceListsQueryParameters
    with _$PostPriceListsQueryParameters {
  const PostPriceListsQueryParameters._();

  @jsonSerializable
  const factory PostPriceListsQueryParameters({
    /// fields
    @JsonKey(name: PostPriceListsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPriceListsQueryParameters;

  factory PostPriceListsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostPriceListsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
