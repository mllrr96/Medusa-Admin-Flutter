/// StoreReturn
/// {
///     "properties": {
///         "items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/StoreReturnItem"
///             },
///             "description": "The return's items."
///         },
///         "status": {
///             "enum": [
///                 "received",
///                 "canceled",
///                 "requested",
///                 "open",
///                 "partially_received"
///             ],
///             "type": "string",
///             "description": "The return's status."
///         },
///         "id": {
///             "type": "string",
///             "description": "The return's ID.",
///             "title": "id"
///         },
///         "display_id": {
///             "type": "number",
///             "description": "The return's display ID.",
///             "title": "display_id"
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the return was created.",
///             "title": "created_at"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order this return belongs to.",
///             "title": "order_id"
///         },
///         "location_id": {
///             "type": "string",
///             "description": "The ID of the location the return items are being returned to.",
///             "title": "location_id"
///         },
///         "canceled_at": {
///             "type": "string",
///             "description": "The date the return was canceled.",
///             "title": "canceled_at"
///         },
///         "exchange_id": {
///             "type": "string",
///             "description": "The ID of the associated exchange.",
///             "title": "exchange_id"
///         },
///         "claim_id": {
///             "type": "string",
///             "description": "The ID of the associated claim.",
///             "title": "claim_id"
///         },
///         "refund_amount": {
///             "type": "number",
///             "description": "The amount to be refunded.",
///             "title": "refund_amount"
///         },
///         "received_at": {
///             "type": "string",
///             "description": "The date the return items were received.",
///             "title": "received_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "items",
///         "id",
///         "display_id",
///         "created_at",
///         "order_id",
///         "canceled_at",
///         "received_at"
///     ],
///     "description": "The return's details."
/// }
library store_return;

import 'exports.dart';
part 'store_return.freezed.dart';
part 'store_return.g.dart'; // StoreReturn

@freezed
abstract class StoreReturn with _$StoreReturn {
  const StoreReturn._();

  @jsonSerializable
  const factory StoreReturn({
    /// items
    @JsonKey(name: StoreReturn.itemsKey) required List<StoreReturnItem> items,

    /// status
    @JsonKey(name: StoreReturn.statusKey) required NullEnum status,

    /// id
    @JsonKey(name: StoreReturn.idKey) required String id,

    /// displayId
    @JsonKey(name: StoreReturn.displayIdKey) required double displayId,

    /// createdAt
    @JsonKey(name: StoreReturn.createdAtKey) required DateTime createdAt,

    /// orderId
    @JsonKey(name: StoreReturn.orderIdKey) required String orderId,

    /// locationId
    @JsonKey(name: StoreReturn.locationIdKey) required String locationId,

    /// canceledAt
    @JsonKey(name: StoreReturn.canceledAtKey) required String canceledAt,

    /// exchangeId
    @JsonKey(name: StoreReturn.exchangeIdKey) required String exchangeId,

    /// claimId
    @JsonKey(name: StoreReturn.claimIdKey) required String claimId,

    /// refundAmount
    @JsonKey(name: StoreReturn.refundAmountKey) required double refundAmount,

    /// receivedAt
    @JsonKey(name: StoreReturn.receivedAtKey) required String receivedAt,
  }) = _StoreReturn;

  factory StoreReturn.fromJson(Map<String, dynamic> json) =>
      _$StoreReturnFromJson(json);

  static const String itemsKey = r'items';

  static const String statusKey = r'status';

  static const String idKey = r'id';

  static const String displayIdKey = r'display_id';

  static const String createdAtKey = r'created_at';

  static const String orderIdKey = r'order_id';

  static const String locationIdKey = r'location_id';

  static const String canceledAtKey = r'canceled_at';

  static const String exchangeIdKey = r'exchange_id';

  static const String claimIdKey = r'claim_id';

  static const String refundAmountKey = r'refund_amount';

  static const String receivedAtKey = r'received_at';
}
