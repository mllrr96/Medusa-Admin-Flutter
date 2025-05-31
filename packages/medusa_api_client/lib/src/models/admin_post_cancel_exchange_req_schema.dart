/// AdminPostCancelExchangeReqSchema
/// {
///     "properties": {
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether to send a notification to the customer about the exchange's cancelation.",
///             "title": "no_notification"
///         }
///     },
///     "type": "object",
///     "description": "The details of canceling an exchange."
/// }
library;

import 'exports.dart';
part 'admin_post_cancel_exchange_req_schema.freezed.dart';
part 'admin_post_cancel_exchange_req_schema.g.dart'; // AdminPostCancelExchangeReqSchema

@freezed
abstract class AdminPostCancelExchangeReqSchema
    with _$AdminPostCancelExchangeReqSchema {
  const AdminPostCancelExchangeReqSchema._();

  @jsonSerializable
  const factory AdminPostCancelExchangeReqSchema({
    /// noNotification
    @JsonKey(name: AdminPostCancelExchangeReqSchema.noNotificationKey)
    required bool noNotification,
  }) = _AdminPostCancelExchangeReqSchema;

  factory AdminPostCancelExchangeReqSchema.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPostCancelExchangeReqSchemaFromJson(json);

  static const String noNotificationKey = r'no_notification';
}
