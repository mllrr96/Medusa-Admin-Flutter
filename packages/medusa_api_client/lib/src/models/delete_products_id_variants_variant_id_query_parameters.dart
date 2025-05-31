/// DeleteProductsIdVariantsVariantIdQueryParameters
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
part 'delete_products_id_variants_variant_id_query_parameters.freezed.dart';
part 'delete_products_id_variants_variant_id_query_parameters.g.dart'; // DeleteProductsIdVariantsVariantIdQueryParameters

@freezed
abstract class DeleteProductsIdVariantsVariantIdQueryParameters
    with _$DeleteProductsIdVariantsVariantIdQueryParameters {
  const DeleteProductsIdVariantsVariantIdQueryParameters._();

  @jsonSerializable
  const factory DeleteProductsIdVariantsVariantIdQueryParameters({
    /// fields
    @JsonKey(name: DeleteProductsIdVariantsVariantIdQueryParameters.fieldsKey)
    required String fields,
  }) = _DeleteProductsIdVariantsVariantIdQueryParameters;

  factory DeleteProductsIdVariantsVariantIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteProductsIdVariantsVariantIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
