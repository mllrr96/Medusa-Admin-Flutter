/// AdminExchange
/// {
///     "properties": {
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order the exchange is created for.",
///             "title": "order_id"
///         },
///         "return_items": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminReturnItem"
///             },
///             "description": "The items returned (inbound) by the exchange."
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
///             "$ref": "#/components/schemas/AdminReturn"
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
///             "type": "string",
///             "description": "The exchange's display ID.",
///             "title": "display_id"
///         },
///         "shipping_methods": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderShippingMethod"
///             },
///             "description": "The shipping methods used to send the new (outbound) items."
///         },
///         "transactions": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/BaseOrderTransaction"
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
///         "order_version": {
///             "type": "string",
///             "description": "The version of the order once the exchange is applied.",
///             "title": "order_version"
///         },
///         "created_by": {
///             "type": "string",
///             "description": "The ID of the user that created the exchange.",
///             "title": "created_by"
///         },
///         "canceled_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the exchange was canceled.",
///             "title": "canceled_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the exchange was deleted.",
///             "title": "deleted_at"
///         },
///         "order": {
///             "$ref": "#/components/schemas/BaseOrder"
///         },
///         "allow_backorder": {
///             "type": "boolean",
///             "description": "Whether variants that are out-of-stock can still be added as additional or outbound items.",
///             "title": "allow_backorder"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "order_id",
///         "created_at",
///         "updated_at",
///         "canceled_at",
///         "deleted_at",
///         "additional_items",
///         "return_items"
///     ],
///     "description": "The exchange's details."
/// }
library;

import 'exports.dart';
part 'admin_exchange.freezed.dart';
part 'admin_exchange.g.dart'; // AdminExchange

@freezed
abstract class AdminExchange with _$AdminExchange {
  const AdminExchange._();

  @jsonSerializable
  const factory AdminExchange({
    /// orderId
    @JsonKey(name: AdminExchange.orderIdKey) required String orderId,

    /// returnItems
    @JsonKey(name: AdminExchange.returnItemsKey)
    required List<AdminReturnItem> returnItems,

    /// additionalItems
    @JsonKey(name: AdminExchange.additionalItemsKey)
    required List<BaseExchangeItem> additionalItems,

    /// noNotification
    @JsonKey(name: AdminExchange.noNotificationKey)
    required bool noNotification,

    /// differenceDue
    @JsonKey(name: AdminExchange.differenceDueKey)
    required double differenceDue,

    /// returnAA
    @JsonKey(name: AdminExchange.returnAAKey) required AdminReturn returnAA,

    /// returnId
    @JsonKey(name: AdminExchange.returnIdKey) required String returnId,

    /// id
    @JsonKey(name: AdminExchange.idKey) required String id,

    /// displayId
    @JsonKey(name: AdminExchange.displayIdKey) required String displayId,

    /// shippingMethods
    @JsonKey(name: AdminExchange.shippingMethodsKey)
    required List<BaseOrderShippingMethod> shippingMethods,

    /// transactions
    @JsonKey(name: AdminExchange.transactionsKey)
    required List<BaseOrderTransaction> transactions,

    /// metadata
    @JsonKey(name: AdminExchange.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: AdminExchange.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminExchange.updatedAtKey) required DateTime updatedAt,

    /// orderVersion
    @JsonKey(name: AdminExchange.orderVersionKey) required String orderVersion,

    /// createdBy
    @JsonKey(name: AdminExchange.createdByKey) required String createdBy,

    /// canceledAt
    @JsonKey(name: AdminExchange.canceledAtKey) required DateTime canceledAt,

    /// deletedAt
    @JsonKey(name: AdminExchange.deletedAtKey) required DateTime deletedAt,

    /// order
    @JsonKey(name: AdminExchange.orderKey) required BaseOrder order,

    /// allowBackorder
    @JsonKey(name: AdminExchange.allowBackorderKey)
    required bool allowBackorder,
  }) = _AdminExchange;

  factory AdminExchange.fromJson(Map<String, dynamic> json) =>
      _$AdminExchangeFromJson(json);

  static const String orderIdKey = r'order_id';

  static const String returnItemsKey = r'return_items';

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

  static const String orderVersionKey = r'order_version';

  static const String createdByKey = r'created_by';

  static const String canceledAtKey = r'canceled_at';

  static const String deletedAtKey = r'deleted_at';

  static const String orderKey = r'order';

  static const String allowBackorderKey = r'allow_backorder';
}
