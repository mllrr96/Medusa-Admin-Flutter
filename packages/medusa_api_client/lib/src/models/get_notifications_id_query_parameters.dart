/// GetNotificationsIdQueryParameters
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
part 'get_notifications_id_query_parameters.freezed.dart';
part 'get_notifications_id_query_parameters.g.dart'; // GetNotificationsIdQueryParameters

@freezed
abstract class GetNotificationsIdQueryParameters
    with _$GetNotificationsIdQueryParameters {
  const GetNotificationsIdQueryParameters._();

  @jsonSerializable
  const factory GetNotificationsIdQueryParameters({
    /// fields
    @JsonKey(name: GetNotificationsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetNotificationsIdQueryParameters;

  factory GetNotificationsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetNotificationsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
