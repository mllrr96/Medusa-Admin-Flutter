/// GetProductsIdOptionsOptionIdQueryParameters
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
part 'get_products_id_options_option_id_query_parameters.freezed.dart';
part 'get_products_id_options_option_id_query_parameters.g.dart'; // GetProductsIdOptionsOptionIdQueryParameters

@freezed
abstract class GetProductsIdOptionsOptionIdQueryParameters
    with _$GetProductsIdOptionsOptionIdQueryParameters {
  const GetProductsIdOptionsOptionIdQueryParameters._();

  @jsonSerializable
  const factory GetProductsIdOptionsOptionIdQueryParameters({
    /// fields
    @JsonKey(name: GetProductsIdOptionsOptionIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetProductsIdOptionsOptionIdQueryParameters;

  factory GetProductsIdOptionsOptionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetProductsIdOptionsOptionIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
