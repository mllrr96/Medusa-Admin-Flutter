/// AdminCreateOrderCreditLines
/// {
///     "properties": {
///         "amount": {
///             "type": "number",
///             "description": "The amount of the credit line.",
///             "title": "amount"
///         },
///         "reference": {
///             "type": "string",
///             "description": "The name of the table that the credit line is referencing.",
///             "title": "reference"
///         },
///         "reference_id": {
///             "type": "string",
///             "description": "The ID of a record in the table that the credit line is referencing.",
///             "title": "reference_id"
///         },
///         "metadata": {
///             "type": "object",
///             "description": "The credit line's metadata, can hold custom key-value pairs."
///         }
///     },
///     "type": "object",
///     "required": [
///         "amount",
///         "reference",
///         "reference_id"
///     ],
///     "description": "The details of a credit line to add to an order."
/// }
library;

import 'exports.dart';
part 'admin_create_order_credit_lines.freezed.dart';
part 'admin_create_order_credit_lines.g.dart'; // AdminCreateOrderCreditLines

@freezed
abstract class AdminCreateOrderCreditLines with _$AdminCreateOrderCreditLines {
  const AdminCreateOrderCreditLines._();

  @jsonSerializable
  const factory AdminCreateOrderCreditLines({
    /// amount
    @JsonKey(name: AdminCreateOrderCreditLines.amountKey)
    required double amount,

    /// reference
    @JsonKey(name: AdminCreateOrderCreditLines.referenceKey)
    required String reference,

    /// referenceId
    @JsonKey(name: AdminCreateOrderCreditLines.referenceIdKey)
    required String referenceId,

    /// metadata
    @JsonKey(name: AdminCreateOrderCreditLines.metadataKey)
    required Map<String, dynamic> metadata,
  }) = _AdminCreateOrderCreditLines;

  factory AdminCreateOrderCreditLines.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateOrderCreditLinesFromJson(json);

  static const String amountKey = r'amount';

  static const String referenceKey = r'reference';

  static const String referenceIdKey = r'reference_id';

  static const String metadataKey = r'metadata';
}
