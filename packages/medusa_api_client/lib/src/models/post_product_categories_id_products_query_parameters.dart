/// PostProductCategoriesIdProductsQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields. This API route restricts the fields that can be selected. Learn how to override the retrievable fields in the [Retrieve Custom Links](https://docs.medusajs.com/learn/fundamentals/api-routes/retrieve-custom-links) documentation.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'post_product_categories_id_products_query_parameters.freezed.dart';
part 'post_product_categories_id_products_query_parameters.g.dart'; // PostProductCategoriesIdProductsQueryParameters

@freezed
abstract class PostProductCategoriesIdProductsQueryParameters
    with _$PostProductCategoriesIdProductsQueryParameters {
  const PostProductCategoriesIdProductsQueryParameters._();

  @jsonSerializable
  const factory PostProductCategoriesIdProductsQueryParameters({
    /// fields
    @JsonKey(name: PostProductCategoriesIdProductsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductCategoriesIdProductsQueryParameters;

  factory PostProductCategoriesIdProductsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductCategoriesIdProductsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
