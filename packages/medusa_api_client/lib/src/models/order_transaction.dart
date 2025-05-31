/// OrderTransaction
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The transaction's ID.",
///             "title": "id"
///         },
///         "order_id": {
///             "type": "string",
///             "description": "The ID of the order this transaction belongs to.",
///             "title": "order_id"
///         },
///         "amount": {
///             "type": "number",
///             "description": "The transaction's amount.",
///             "title": "amount"
///         },
///         "currency_code": {
///             "type": "string",
///             "description": "The transaction's currency code.",
///             "title": "currency_code"
///         },
///         "reference": {
///             "enum": [
///                 "capture",
///                 "refund"
///             ],
///             "type": "string",
///             "description": "The name of a table that this transaction references. If this transaction is for captured payment, its value is `capture`. If this transaction is for refunded payment, its value is `refund`.",
///             "title": "reference"
///         },
///         "reference_id": {
///             "type": "string",
///             "description": "The ID of the referenced record in the referenced table.",
///             "title": "reference_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The transaction's metadata, can hold custom key-value pairs."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date that the transaction was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date that the transaction was updated.",
///             "title": "updated_at"
///         },
///         "order": {
///             "type": "object"
///         },
///         "version": {
///             "type": "number",
///             "description": "The order version that the transaction belongs to.",
///             "title": "version"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "order_id",
///         "version",
///         "order",
///         "amount",
///         "currency_code",
///         "reference",
///         "reference_id",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The transaction's details."
/// }
library order_transaction;

import 'exports.dart';
part 'order_transaction.freezed.dart';
part 'order_transaction.g.dart'; // OrderTransaction

@freezed
abstract class OrderTransaction with _$OrderTransaction {
  const OrderTransaction._();

  @jsonSerializable
  const factory OrderTransaction({
    /// id
    @JsonKey(name: OrderTransaction.idKey) required String id,

    /// orderId
    @JsonKey(name: OrderTransaction.orderIdKey) required String orderId,

    /// amount
    @JsonKey(name: OrderTransaction.amountKey) required double amount,

    /// currencyCode
    @JsonKey(name: OrderTransaction.currencyCodeKey)
    required String currencyCode,

    /// reference
    @JsonKey(name: OrderTransaction.referenceKey)
    required ReferenceEnum reference,

    /// referenceId
    @JsonKey(name: OrderTransaction.referenceIdKey) required String referenceId,

    /// metadata
    @JsonKey(name: OrderTransaction.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: OrderTransaction.createdAtKey) required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: OrderTransaction.updatedAtKey) required DateTime updatedAt,

    /// order
    @JsonKey(name: OrderTransaction.orderKey)
    required Map<String, dynamic> order,

    /// version
    @JsonKey(name: OrderTransaction.versionKey) required double version,
  }) = _OrderTransaction;

  factory OrderTransaction.fromJson(Map<String, dynamic> json) =>
      _$OrderTransactionFromJson(json);

  static const String idKey = r'id';

  static const String orderIdKey = r'order_id';

  static const String amountKey = r'amount';

  static const String currencyCodeKey = r'currency_code';

  static const String referenceKey = r'reference';

  static const String referenceIdKey = r'reference_id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String orderKey = r'order';

  static const String versionKey = r'version';
}
