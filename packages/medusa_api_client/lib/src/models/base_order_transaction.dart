/// BaseOrderTransaction
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
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "order_id",
///         "amount",
///         "currency_code",
///         "reference",
///         "reference_id",
///         "metadata",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "An order transaction's details."
/// }
library base_order_transaction;

import 'exports.dart';
part 'base_order_transaction.freezed.dart';
part 'base_order_transaction.g.dart'; // BaseOrderTransaction

@freezed
abstract class BaseOrderTransaction with _$BaseOrderTransaction {
  const BaseOrderTransaction._();

  @jsonSerializable
  const factory BaseOrderTransaction({
    /// id
    @JsonKey(name: BaseOrderTransaction.idKey) required String id,

    /// orderId
    @JsonKey(name: BaseOrderTransaction.orderIdKey) required String orderId,

    /// amount
    @JsonKey(name: BaseOrderTransaction.amountKey) required double amount,

    /// currencyCode
    @JsonKey(name: BaseOrderTransaction.currencyCodeKey)
    required String currencyCode,

    /// reference
    @JsonKey(name: BaseOrderTransaction.referenceKey)
    required ReferenceEnum reference,

    /// referenceId
    @JsonKey(name: BaseOrderTransaction.referenceIdKey)
    required String referenceId,

    /// metadata
    @JsonKey(name: BaseOrderTransaction.metadataKey)
    required Map<String, dynamic> metadata,

    /// createdAt
    @JsonKey(name: BaseOrderTransaction.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: BaseOrderTransaction.updatedAtKey)
    required DateTime updatedAt,
  }) = _BaseOrderTransaction;

  factory BaseOrderTransaction.fromJson(Map<String, dynamic> json) =>
      _$BaseOrderTransactionFromJson(json);

  static const String idKey = r'id';

  static const String orderIdKey = r'order_id';

  static const String amountKey = r'amount';

  static const String currencyCodeKey = r'currency_code';

  static const String referenceKey = r'reference';

  static const String referenceIdKey = r'reference_id';

  static const String metadataKey = r'metadata';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';
}
