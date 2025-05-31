/// PostProductsIdVariantsVariantIdQueryParameters
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
part 'post_products_id_variants_variant_id_query_parameters.freezed.dart';
part 'post_products_id_variants_variant_id_query_parameters.g.dart'; // PostProductsIdVariantsVariantIdQueryParameters

@freezed
abstract class PostProductsIdVariantsVariantIdQueryParameters
    with _$PostProductsIdVariantsVariantIdQueryParameters {
  const PostProductsIdVariantsVariantIdQueryParameters._();

  @jsonSerializable
  const factory PostProductsIdVariantsVariantIdQueryParameters({
    /// fields
    @JsonKey(name: PostProductsIdVariantsVariantIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductsIdVariantsVariantIdQueryParameters;

  factory PostProductsIdVariantsVariantIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductsIdVariantsVariantIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
