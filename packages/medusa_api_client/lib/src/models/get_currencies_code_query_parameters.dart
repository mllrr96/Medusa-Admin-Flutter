/// GetCurrenciesCodeQueryParameters
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
part 'get_currencies_code_query_parameters.freezed.dart';
part 'get_currencies_code_query_parameters.g.dart'; // GetCurrenciesCodeQueryParameters

@freezed
abstract class GetCurrenciesCodeQueryParameters
    with _$GetCurrenciesCodeQueryParameters {
  const GetCurrenciesCodeQueryParameters._();

  @jsonSerializable
  const factory GetCurrenciesCodeQueryParameters({
    /// fields
    @JsonKey(name: GetCurrenciesCodeQueryParameters.fieldsKey)
    required String fields,
  }) = _GetCurrenciesCodeQueryParameters;

  factory GetCurrenciesCodeQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetCurrenciesCodeQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
