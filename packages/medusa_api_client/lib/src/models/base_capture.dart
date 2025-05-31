/// BaseCapture
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The payment capture's ID.",
///             "title": "id"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The captured amount.",
///             "title": "amount"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the capture was created.",
///             "title": "created_at"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that captured the payment.",
///             "title": "created_by"
///         },
///         "payment": {
///             "type": "object"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "amount",
///         "created_at",
///         "payment"
///     ],
///     "description": "The details of a captured payment."
/// }
library base_capture;

import 'exports.dart';
part 'base_capture.freezed.dart';
part 'base_capture.g.dart'; // BaseCapture

@freezed
abstract class BaseCapture with _$BaseCapture {
  const BaseCapture._();

  @jsonSerializable
  const factory BaseCapture({
    /// id
    @JsonKey(name: BaseCapture.idKey) required String id,

    /// amount
    @JsonKey(name: BaseCapture.amountKey) required double amount,

    /// createdAt
    @JsonKey(name: BaseCapture.createdAtKey) required DateTime createdAt,

    /// createdBy
    @JsonKey(name: BaseCapture.createdByKey) required String createdBy,

    /// payment
    @JsonKey(name: BaseCapture.paymentKey)
    required Map<String, dynamic> payment,
  }) = _BaseCapture;

  factory BaseCapture.fromJson(Map<String, dynamic> json) =>
      _$BaseCaptureFromJson(json);

  static const String idKey = r'id';

  static const String amountKey = r'amount';

  static const String createdAtKey = r'created_at';

  static const String createdByKey = r'created_by';

  static const String paymentKey = r'payment';
}
