/// GetCustomersIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields. This API route restricts the fields that can be selected. Learn how to override the retrievable fields in the [Retrieve Custom Links](https://docs.medusajs.com/learn/fundamentals/api-routes/retrieve-custom-links) documentation.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_customers_id_query_parameters.freezed.dart';
part 'get_customers_id_query_parameters.g.dart'; // GetCustomersIdQueryParameters

@freezed
abstract class GetCustomersIdQueryParameters
    with _$GetCustomersIdQueryParameters {
  const GetCustomersIdQueryParameters._();

  @jsonSerializable
  const factory GetCustomersIdQueryParameters({
    /// fields
    @JsonKey(name: GetCustomersIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetCustomersIdQueryParameters;

  factory GetCustomersIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetCustomersIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
