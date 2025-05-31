/// PostPriceListsIdProductsQueryParameters
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
part 'post_price_lists_id_products_query_parameters.freezed.dart';
part 'post_price_lists_id_products_query_parameters.g.dart'; // PostPriceListsIdProductsQueryParameters

@freezed
abstract class PostPriceListsIdProductsQueryParameters
    with _$PostPriceListsIdProductsQueryParameters {
  const PostPriceListsIdProductsQueryParameters._();

  @jsonSerializable
  const factory PostPriceListsIdProductsQueryParameters({
    /// fields
    @JsonKey(name: PostPriceListsIdProductsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPriceListsIdProductsQueryParameters;

  factory PostPriceListsIdProductsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPriceListsIdProductsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
