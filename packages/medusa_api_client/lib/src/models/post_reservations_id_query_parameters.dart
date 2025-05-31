/// PostReservationsIdQueryParameters
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
part 'post_reservations_id_query_parameters.freezed.dart';
part 'post_reservations_id_query_parameters.g.dart'; // PostReservationsIdQueryParameters

@freezed
abstract class PostReservationsIdQueryParameters
    with _$PostReservationsIdQueryParameters {
  const PostReservationsIdQueryParameters._();

  @jsonSerializable
  const factory PostReservationsIdQueryParameters({
    /// fields
    @JsonKey(name: PostReservationsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReservationsIdQueryParameters;

  factory PostReservationsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReservationsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
