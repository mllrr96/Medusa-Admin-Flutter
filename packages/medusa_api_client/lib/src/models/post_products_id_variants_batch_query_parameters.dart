/// PostProductsIdVariantsBatchQueryParameters
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
part 'post_products_id_variants_batch_query_parameters.freezed.dart';
part 'post_products_id_variants_batch_query_parameters.g.dart'; // PostProductsIdVariantsBatchQueryParameters

@freezed
abstract class PostProductsIdVariantsBatchQueryParameters
    with _$PostProductsIdVariantsBatchQueryParameters {
  const PostProductsIdVariantsBatchQueryParameters._();

  @jsonSerializable
  const factory PostProductsIdVariantsBatchQueryParameters({
    /// fields
    @JsonKey(name: PostProductsIdVariantsBatchQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductsIdVariantsBatchQueryParameters;

  factory PostProductsIdVariantsBatchQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductsIdVariantsBatchQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
