/// StoreDeclineOrderTransferRequest
/// {
///     "properties": {
///         "token": {
///             "type": "string",
///             "description": "The order transfer's token issued when the transfer was requested.",
///             "title": "token"
///         }
///     },
///     "type": "object",
///     "required": [
///         "token"
///     ],
///     "description": "The details of declining the order transfer request."
/// }
library;

import 'exports.dart';
part 'store_decline_order_transfer_request.freezed.dart';
part 'store_decline_order_transfer_request.g.dart'; // StoreDeclineOrderTransferRequest

@freezed
abstract class StoreDeclineOrderTransferRequest
    with _$StoreDeclineOrderTransferRequest {
  const StoreDeclineOrderTransferRequest._();

  @jsonSerializable
  const factory StoreDeclineOrderTransferRequest({
    /// token
    @JsonKey(name: StoreDeclineOrderTransferRequest.tokenKey)
    required String token,
  }) = _StoreDeclineOrderTransferRequest;

  factory StoreDeclineOrderTransferRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$StoreDeclineOrderTransferRequestFromJson(json);

  static const String tokenKey = r'token';
}
