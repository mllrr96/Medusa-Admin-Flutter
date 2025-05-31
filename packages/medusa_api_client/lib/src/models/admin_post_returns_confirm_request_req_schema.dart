/// AdminPostReturnsConfirmRequestReqSchema
/// {
///     "properties": {
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether to send the customer a notification about the confirmation.",
///             "title": "no_notification"
///         }
///     },
///     "type": "object",
///     "description": "The confirmation's details."
/// }
library;

import 'exports.dart';
part 'admin_post_returns_confirm_request_req_schema.freezed.dart';
part 'admin_post_returns_confirm_request_req_schema.g.dart'; // AdminPostReturnsConfirmRequestReqSchema

@freezed
abstract class AdminPostReturnsConfirmRequestReqSchema
    with _$AdminPostReturnsConfirmRequestReqSchema {
  const AdminPostReturnsConfirmRequestReqSchema._();

  @jsonSerializable
  const factory AdminPostReturnsConfirmRequestReqSchema({
    /// noNotification
    @JsonKey(name: AdminPostReturnsConfirmRequestReqSchema.noNotificationKey)
    required bool noNotification,
  }) = _AdminPostReturnsConfirmRequestReqSchema;

  factory AdminPostReturnsConfirmRequestReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostReturnsConfirmRequestReqSchemaFromJson(json);

  static const String noNotificationKey = r'no_notification';
}
