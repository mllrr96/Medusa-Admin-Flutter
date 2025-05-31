/// PostProductsIdVariantsQueryParameters
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
part 'post_products_id_variants_query_parameters.freezed.dart';
part 'post_products_id_variants_query_parameters.g.dart'; // PostProductsIdVariantsQueryParameters

@freezed
abstract class PostProductsIdVariantsQueryParameters
    with _$PostProductsIdVariantsQueryParameters {
  const PostProductsIdVariantsQueryParameters._();

  @jsonSerializable
  const factory PostProductsIdVariantsQueryParameters({
    /// fields
    @JsonKey(name: PostProductsIdVariantsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductsIdVariantsQueryParameters;

  factory PostProductsIdVariantsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductsIdVariantsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
