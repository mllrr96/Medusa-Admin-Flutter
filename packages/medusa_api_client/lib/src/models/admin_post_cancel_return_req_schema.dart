/// AdminPostCancelReturnReqSchema
/// {
///     "properties": {
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether to send the customer a notification about the return's cancelation.",
///             "title": "no_notification"
///         }
///     },
///     "type": "object",
///     "description": "The details of canceling a return."
/// }
library;

import 'exports.dart';
part 'admin_post_cancel_return_req_schema.freezed.dart';
part 'admin_post_cancel_return_req_schema.g.dart'; // AdminPostCancelReturnReqSchema

@freezed
abstract class AdminPostCancelReturnReqSchema
    with _$AdminPostCancelReturnReqSchema {
  const AdminPostCancelReturnReqSchema._();

  @jsonSerializable
  const factory AdminPostCancelReturnReqSchema({
    /// noNotification
    @JsonKey(name: AdminPostCancelReturnReqSchema.noNotificationKey)
    required bool noNotification,
  }) = _AdminPostCancelReturnReqSchema;

  factory AdminPostCancelReturnReqSchema.fromJson(Map<String, dynamic> json) =>
      _$AdminPostCancelReturnReqSchemaFromJson(json);

  static const String noNotificationKey = r'no_notification';
}
