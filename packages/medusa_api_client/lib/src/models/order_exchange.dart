/// OrderExchange
/// {
///     "properties": {
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order the exchange is created for.",
///             "title": "order_id"
///         },
///         "additional_items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseExchangeItem"
///             },
///             "description": "The new items (outbound) sent by the exchange."
///         },
///         "no_notification": {
///             "type": "boolean",
///             "description": "Whether to send the customer notifications when the exchange is updated.",
///             "title": "no_notification"
///         },
///         "difference_due": {
///             "type": "number",
///             "description": "The amount to be exchanged or refunded. If the amount is negative, it must be refunded. If positive, additional payment is required from the customer.",
///             "title": "difference_due"
///         },
///         "return": {
///             "$ref": "#/components/schemas/Return"
///         },
///         "return_id": {
///             "type": "string",
///             "description": "The ID of the associated exchange.",
///             "title": "return_id"
///         },
///         "id": {
///             "type": "string",
///             "description": "The exchange's ID.",
///             "title": "id"
///         },
///         "display_id": {
///             "type": "number",
///             "description": "The exchange's display ID.",
///             "title": "display_id"
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderShippingMethod"
///             },
///             "description": "The shipping methods used to send the new (outbound) items."
///         },
///         "transactions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/OrderTransaction"
///             },
///             "description": "The exchange's transactions."
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The exchange's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date that the exchange was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date that the exchange was updated.",
///             "title": "updated_at"
///         },
///         "order": {
///             "$ref": "#/components/schemas/Order"
///         },
///         "order_version": {
///             "type": "number",
///             "description": "The version of the order when the exchange is applied.",
///             "title": "order_version"
///         },
///         "raw_difference_due": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The exchange's raw difference due.",
///                     "title": "raw_difference_due"
///                 },
///                 {
///                     "type": "number",
///                     "description": "The exchange's raw difference due.",
///                     "title": "raw_difference_due"
///                 },
///                 {
///                     "type": "string",
///                     "description": "The exchange's raw difference due.",
///                     "title": "raw_difference_due"
///                 },
///                 {
///                     "type": "number",
///                     "description": "The exchange's raw difference due.",
///                     "title": "raw_difference_due"
///                 }
///             ]
///         },
///         "allow_backorder": {
///             "type": "boolean",
///             "description": "Whether variants that are out of stock can be added to the exchange as outbound items.",
///             "title": "allow_backorder"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the exchange.",
///             "title": "created_by"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the exchange was deleted.",
///             "title": "deleted_at"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the exchange was canceled.",
///             "title": "canceled_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "order_id",
///         "order_version",
///         "display_id",
///         "additional_items",
///         "metadata"
///     ],
///     "description": "The order change's exchange."
/// }
library;

import 'exports.dart';
part 'order_exchange.freezed.dart';
part 'order_exchange.g.dart'; // OrderExchange

@freezed
abstract class OrderExchange with _$OrderExchange {
  const OrderExchange._();

  @jsonSerializable
  const factory OrderExchange({
    /// orderId
    @JsonKey(name: OrderExchange.orderIdKey) required String orderId,

    /// additionalItems
    @JsonKey(name: OrderExchange.additionalItemsKey)
    required List<BaseExchangeItem> additionalItems,

    /// noNotification
    @JsonKey(name: OrderExchange.noNotificationKey)
    required bool noNotification,

    /// differenceDue
    @JsonKey(name: OrderExchange.differenceDueKey)
    required double differenceDue,

    /// returnAA
    @JsonKey(name: OrderExchange.returnAAKey) required ReturnAA returnAA,

    /// returnId
    @JsonKey(name: OrderExchange.returnIdKey) required String returnId,

    /// id
    @JsonKey(name: OrderExchange.idKey) required String id,

    /// displayId
    @JsonKey(name: OrderExchange.displayIdKey) required double displayId,

    /// shippingMethods
    @JsonKey(name: OrderExchange.shippingMethodsKey)
    required List<OrderShippingMethod> shippingMethods,

    /// transactions
    @JsonKey(name: OrderExchange.transactionsKey)
    required List<OrderTransaction> transactions,

    /// metadata
    @JsonKey(name: OrderExchange.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: OrderExchange.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderExchange.updatedAtKey) required DateTime updatedAt,

    /// order
    @JsonKey(name: OrderExchange.orderKey) required Order order,

    /// orderVersion
    @JsonKey(name: OrderExchange.orderVersionKey) required double orderVersion,

    /// rawDifferenceDue
    @JsonKey(name: OrderExchange.rawDifferenceDueKey)
    required dynamic rawDifferenceDue,

    /// allowBackorder
    @JsonKey(name: OrderExchange.allowBackorderKey)
    required bool allowBackorder,

    /// createdBy
    @JsonKey(name: OrderExchange.createdByKey) required String createdBy,

    /// deletedAt
    @JsonKey(name: OrderExchange.deletedAtKey) required DateTime deletedAt,

    /// canceledAt
    @JsonKey(name: OrderExchange.canceledAtKey) required DateTime canceledAt,
  }) = _OrderExchange;

  factory OrderExchange.fromJson(Map<String, dynamic> json) =>
      _$OrderExchangeFromJson(json);

  static const String orderIdKey = r'order_id';

  static const String additionalItemsKey = r'additional_items';

  static const String noNotificationKey = r'no_notification';

  static const String differenceDueKey = r'difference_due';

  static const String returnAAKey = r'return';

  static const String returnIdKey = r'return_id';

  static const String idKey = r'id';

  static const String displayIdKey = r'display_id';

  static const String shippingMethodsKey = r'shipping_methods';

  static const String transactionsKey = r'transactions';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String orderKey = r'order';

  static const String orderVersionKey = r'order_version';

  static const String rawDifferenceDueKey = r'raw_difference_due';

  static const String allowBackorderKey = r'allow_backorder';

  static const String createdByKey = r'created_by';

  static const String deletedAtKey = r'deleted_at';

  static const String canceledAtKey = r'canceled_at';
}
