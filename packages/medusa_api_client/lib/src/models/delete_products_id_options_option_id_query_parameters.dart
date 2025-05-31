/// DeleteProductsIdOptionsOptionIdQueryParameters
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
part 'delete_products_id_options_option_id_query_parameters.freezed.dart';
part 'delete_products_id_options_option_id_query_parameters.g.dart'; // DeleteProductsIdOptionsOptionIdQueryParameters

@freezed
abstract class DeleteProductsIdOptionsOptionIdQueryParameters
    with _$DeleteProductsIdOptionsOptionIdQueryParameters {
  const DeleteProductsIdOptionsOptionIdQueryParameters._();

  @jsonSerializable
  const factory DeleteProductsIdOptionsOptionIdQueryParameters({
    /// fields
    @JsonKey(name: DeleteProductsIdOptionsOptionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _DeleteProductsIdOptionsOptionIdQueryParameters;

  factory DeleteProductsIdOptionsOptionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$DeleteProductsIdOptionsOptionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
