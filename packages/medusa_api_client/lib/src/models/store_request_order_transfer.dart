/// StoreRequestOrderTransfer
/// {
///     "properties": {
///         "description": {
///             "type": "string",
///             "description": "The transfer's description, which can be shown to the other customer receiving the request.",
///             "title": "description"
///         }
///     },
///     "type": "object",
///     "description": "The details of requesting the order transfer."
/// }
library;

import 'exports.dart';
part 'store_request_order_transfer.freezed.dart';
part 'store_request_order_transfer.g.dart'; // StoreRequestOrderTransfer

@freezed
abstract class StoreRequestOrderTransfer with _$StoreRequestOrderTransfer {
  const StoreRequestOrderTransfer._();

  @jsonSerializable
  const factory StoreRequestOrderTransfer({
    /// description
    @JsonKey(name: StoreRequestOrderTransfer.descriptionKey)
    required String description,
  }) = _StoreRequestOrderTransfer;

  factory StoreRequestOrderTransfer.fromJson(Map<String, dynamic> json) =>
      _$StoreRequestOrderTransferFromJson(json);

  static const String descriptionKey = r'description';
}
