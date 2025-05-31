/// PostPriceListsIdQueryParameters
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
part 'post_price_lists_id_query_parameters.freezed.dart';
part 'post_price_lists_id_query_parameters.g.dart'; // PostPriceListsIdQueryParameters

@freezed
abstract class PostPriceListsIdQueryParameters
    with _$PostPriceListsIdQueryParameters {
  const PostPriceListsIdQueryParameters._();

  @jsonSerializable
  const factory PostPriceListsIdQueryParameters({
    /// fields
    @JsonKey(name: PostPriceListsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPriceListsIdQueryParameters;

  factory PostPriceListsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostPriceListsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
