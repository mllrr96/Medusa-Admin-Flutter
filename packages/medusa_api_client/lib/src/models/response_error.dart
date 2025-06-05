/// Error
/// {
///     "properties": {
///         "code": {
///             "enum": [
///                 "invalid_state_error",
///                 "invalid_request_error",
///                 "api_error",
///                 "unknown_error"
///             ],
///             "type": "string",
///             "description": "A slug code to indicate the type of the error."
///         },
///         "message": {
///             "type": "string",
///             "description": "Description of the error that occurred."
///         },
///         "type": {
///             "enum": [
///                 "QueryRunnerAlreadyReleasedError",
///                 "TransactionAlreadyStartedError",
///                 "TransactionNotStartedError",
///                 "conflict",
///                 "unauthorized",
///                 "payment_authorization_error",
///                 "duplicate_error",
///                 "not_allowed",
///                 "invalid_data",
///                 "not_found",
///                 "database_error",
///                 "unexpected_state",
///                 "invalid_argument",
///                 "unknown_error"
///             ],
///             "type": "string",
///             "description": "A slug indicating the type of the error."
///         }
///     },
///     "type": "object",
///     "title": "Response Error"
/// }
library;

import 'exports.dart';
part 'response_error.freezed.dart';
part 'response_error.g.dart'; // ResponseError

@freezed
abstract class ResponseError with _$ResponseError {
  const ResponseError._();

  @jsonSerializable
  const factory ResponseError({
    /// code
    @JsonKey(name: ResponseError.codeKey) required NullEnum code,

    /// message
    @JsonKey(name: ResponseError.messageKey) required String message,

    /// type
    @JsonKey(name: ResponseError.typeKey) required NullEnum type,
  }) = _ResponseError;

  factory ResponseError.fromJson(Map<String, dynamic> json) =>
      _$ResponseErrorFromJson(json);

  static const String codeKey = r'code';

  static const String messageKey = r'message';

  static const String typeKey = r'type';
}
