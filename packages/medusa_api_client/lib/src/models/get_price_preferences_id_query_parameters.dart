/// GetPricePreferencesIdQueryParameters
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
part 'get_price_preferences_id_query_parameters.freezed.dart';
part 'get_price_preferences_id_query_parameters.g.dart'; // GetPricePreferencesIdQueryParameters

@freezed
abstract class GetPricePreferencesIdQueryParameters
    with _$GetPricePreferencesIdQueryParameters {
  const GetPricePreferencesIdQueryParameters._();

  @jsonSerializable
  const factory GetPricePreferencesIdQueryParameters({
    /// fields
    @JsonKey(name: GetPricePreferencesIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetPricePreferencesIdQueryParameters;

  factory GetPricePreferencesIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetPricePreferencesIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
