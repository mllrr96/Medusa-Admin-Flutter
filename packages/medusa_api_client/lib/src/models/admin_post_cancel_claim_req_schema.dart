/// AdminPostCancelClaimReqSchema
/// {
///     "properties": {
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether to send the customer a notification about the claim's cancelation.",
///             "title": "no_notification"
///         }
///     },
///     "type": "object",
///     "description": "The details of canceling a claim."
/// }
library;

import 'exports.dart';
part 'admin_post_cancel_claim_req_schema.freezed.dart';
part 'admin_post_cancel_claim_req_schema.g.dart'; // AdminPostCancelClaimReqSchema

@freezed
abstract class AdminPostCancelClaimReqSchema
    with _$AdminPostCancelClaimReqSchema {
  const AdminPostCancelClaimReqSchema._();

  @jsonSerializable
  const factory AdminPostCancelClaimReqSchema({
    /// noNotification
    @JsonKey(name: AdminPostCancelClaimReqSchema.noNotificationKey)
    required bool noNotification,
  }) = _AdminPostCancelClaimReqSchema;

  factory AdminPostCancelClaimReqSchema.fromJson(Map<String, dynamic> json) =>
      _$AdminPostCancelClaimReqSchemaFromJson(json);

  static const String noNotificationKey = r'no_notification';
}
