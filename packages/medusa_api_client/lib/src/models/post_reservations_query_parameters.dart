/// PostReservationsQueryParameters
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
part 'post_reservations_query_parameters.freezed.dart';
part 'post_reservations_query_parameters.g.dart'; // PostReservationsQueryParameters

@freezed
abstract class PostReservationsQueryParameters
    with _$PostReservationsQueryParameters {
  const PostReservationsQueryParameters._();

  @jsonSerializable
  const factory PostReservationsQueryParameters({
    /// fields
    @JsonKey(name: PostReservationsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReservationsQueryParameters;

  factory PostReservationsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostReservationsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
