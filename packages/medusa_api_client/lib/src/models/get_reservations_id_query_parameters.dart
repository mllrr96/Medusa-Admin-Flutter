/// GetReservationsIdQueryParameters
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
part 'get_reservations_id_query_parameters.freezed.dart';
part 'get_reservations_id_query_parameters.g.dart'; // GetReservationsIdQueryParameters

@freezed
abstract class GetReservationsIdQueryParameters
    with _$GetReservationsIdQueryParameters {
  const GetReservationsIdQueryParameters._();

  @jsonSerializable
  const factory GetReservationsIdQueryParameters({
    /// fields
    @JsonKey(name: GetReservationsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetReservationsIdQueryParameters;

  factory GetReservationsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetReservationsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
