/// GetProductsIdVariantsVariantIdQueryParameters
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
part 'get_products_id_variants_variant_id_query_parameters.freezed.dart';
part 'get_products_id_variants_variant_id_query_parameters.g.dart'; // GetProductsIdVariantsVariantIdQueryParameters

@freezed
abstract class GetProductsIdVariantsVariantIdQueryParameters
    with _$GetProductsIdVariantsVariantIdQueryParameters {
  const GetProductsIdVariantsVariantIdQueryParameters._();

  @jsonSerializable
  const factory GetProductsIdVariantsVariantIdQueryParameters({
    /// fields
    @JsonKey(name: GetProductsIdVariantsVariantIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetProductsIdVariantsVariantIdQueryParameters;

  factory GetProductsIdVariantsVariantIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetProductsIdVariantsVariantIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
