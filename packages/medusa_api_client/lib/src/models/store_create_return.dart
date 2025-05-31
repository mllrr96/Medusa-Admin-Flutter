/// StoreCreateReturn
/// {
///     "properties": {
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order this return is created for.",
///             "title": "order_id"
///         },
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreCreateReturnItem"
///             },
///             "description": "The return's items."
///         },
///         "return_shipping": {
///             "$ref": "#/components/schemas/StoreCreateReturnShipping"
///         },
///         "note": {
///             "type": "string",
///             "description": "A note with more details about the return.",
///             "title": "note"
///         },
///         "receive_now": {
///             "type": "boolean",
///             "description": "Whether to mark the return as received.",
///             "title": "receive_now"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the location that items are returned to.",
///             "title": "location_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_id",
///         "items",
///         "return_shipping"
///     ],
///     "description": "The details of the return to create."
/// }
library store_create_return;

import 'exports.dart';
part 'store_create_return.freezed.dart';
part 'store_create_return.g.dart'; // StoreCreateReturn

@freezed
abstract class StoreCreateReturn with _$StoreCreateReturn {
  const StoreCreateReturn._();

  @jsonSerializable
  const factory StoreCreateReturn({
    /// orderId
    @JsonKey(name: StoreCreateReturn.orderIdKey) required String orderId,

    /// items
    @JsonKey(name: StoreCreateReturn.itemsKey)
    required List<StoreCreateReturnItem> items,

    /// returnShipping
    @JsonKey(name: StoreCreateReturn.returnShippingKey)
    required StoreCreateReturnShipping returnShipping,

    /// note
    @JsonKey(name: StoreCreateReturn.noteKey) required String note,

    /// receiveNow
    @JsonKey(name: StoreCreateReturn.receiveNowKey) required bool receiveNow,

    /// locationId
    @JsonKey(name: StoreCreateReturn.locationIdKey) required String locationId,
  }) = _StoreCreateReturn;

  factory StoreCreateReturn.fromJson(Map<String, dynamic> json) =>
      _$StoreCreateReturnFromJson(json);

  static const String orderIdKey = r'order_id';

  static const String itemsKey = r'items';

  static const String returnShippingKey = r'return_shipping';

  static const String noteKey = r'note';

  static const String receiveNowKey = r'receive_now';

  static const String locationIdKey = r'location_id';
}
