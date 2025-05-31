/// StoreAcceptOrderTransfer
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
///     "description": "The details of accepting the order transfer."
/// }
library store_accept_order_transfer;

import 'exports.dart';
part 'store_accept_order_transfer.freezed.dart';
part 'store_accept_order_transfer.g.dart'; // StoreAcceptOrderTransfer

@freezed
abstract class StoreAcceptOrderTransfer with _$StoreAcceptOrderTransfer {
  const StoreAcceptOrderTransfer._();

  @jsonSerializable
  const factory StoreAcceptOrderTransfer({
    /// token
    @JsonKey(name: StoreAcceptOrderTransfer.tokenKey) required String token,
  }) = _StoreAcceptOrderTransfer;

  factory StoreAcceptOrderTransfer.fromJson(Map<String, dynamic> json) =>
      _$StoreAcceptOrderTransferFromJson(json);

  static const String tokenKey = r'token';
}
