/// GetStockLocationsIdQueryParameters
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
part 'get_stock_locations_id_query_parameters.freezed.dart';
part 'get_stock_locations_id_query_parameters.g.dart'; // GetStockLocationsIdQueryParameters

@freezed
abstract class GetStockLocationsIdQueryParameters
    with _$GetStockLocationsIdQueryParameters {
  const GetStockLocationsIdQueryParameters._();

  @jsonSerializable
  const factory GetStockLocationsIdQueryParameters({
    /// fields
    @JsonKey(name: GetStockLocationsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetStockLocationsIdQueryParameters;

  factory GetStockLocationsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetStockLocationsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
