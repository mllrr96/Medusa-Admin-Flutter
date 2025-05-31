/// GetShippingOptionsIdQueryParameters
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
part 'get_shipping_options_id_query_parameters.freezed.dart';
part 'get_shipping_options_id_query_parameters.g.dart'; // GetShippingOptionsIdQueryParameters

@freezed
abstract class GetShippingOptionsIdQueryParameters
    with _$GetShippingOptionsIdQueryParameters {
  const GetShippingOptionsIdQueryParameters._();

  @jsonSerializable
  const factory GetShippingOptionsIdQueryParameters({
    /// fields
    @JsonKey(name: GetShippingOptionsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetShippingOptionsIdQueryParameters;

  factory GetShippingOptionsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetShippingOptionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
