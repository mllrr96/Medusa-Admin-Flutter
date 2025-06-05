/// OrderCreditLine
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The credit line's ID.",
///             "title": "id"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the associated order.",
///             "title": "order_id"
///         },
///         "order": {
///             "type": "object"
///         },
///         "reference": {
///             "type": "string",
///             "description": "The table that this credit line references. For example, `payment_collection`.",
///             "title": "reference"
///         },
///         "reference_id": {
///             "type": "string",
///             "description": "The ID of the record in the referenced table. For example, `paycol_123`.",
///             "title": "reference_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The credit line's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the credit line was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the credit line was updated.",
///             "title": "updated_at"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The credit line's amount.",
///             "title": "amount"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "order_id",
///         "order",
///         "amount",
///         "reference",
///         "reference_id",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The credit line's details."
/// }
library;

import 'exports.dart';
part 'order_credit_line.freezed.dart';
part 'order_credit_line.g.dart'; // OrderCreditLine

@freezed
abstract class OrderCreditLine with _$OrderCreditLine {
  const OrderCreditLine._();

  @jsonSerializable
  const factory OrderCreditLine({
    /// id
    @JsonKey(name: OrderCreditLine.idKey) required String id,

    /// orderId
    @JsonKey(name: OrderCreditLine.orderIdKey) required String orderId,

    /// order
    @JsonKey(name: OrderCreditLine.orderKey)
    required Map<String, dynamic> order,

    /// reference
    @JsonKey(name: OrderCreditLine.referenceKey) required String reference,

    /// referenceId
    @JsonKey(name: OrderCreditLine.referenceIdKey) required String referenceId,

    /// metadata
    @JsonKey(name: OrderCreditLine.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: OrderCreditLine.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderCreditLine.updatedAtKey) required DateTime updatedAt,

    /// amount
    @JsonKey(name: OrderCreditLine.amountKey) required double amount,
  }) = _OrderCreditLine;

  factory OrderCreditLine.fromJson(Map<String, dynamic> json) =>
      _$OrderCreditLineFromJson(json);

  static const String idKey = r'id';

  static const String orderIdKey = r'order_id';

  static const String orderKey = r'order';

  static const String referenceKey = r'reference';

  static const String referenceIdKey = r'reference_id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String amountKey = r'amount';
}
