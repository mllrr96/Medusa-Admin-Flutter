/// AdminImportProductResponse
/// {
///     "properties": {
///         "transaction_id": {
///             "type": "string",
///             "description": "The ID of the workflow execution's transaction. This is useful to confirm the import using the `/admin/products/:transaction-id/import` API route.",
///             "title": "transaction_id"
///         },
///         "summary": {
///             "type": "object",
///             "description": "The import's summary."
///         }
///     },
///     "type": "object",
///     "required": [
///         "transaction_id",
///         "summary"
///     ],
///     "description": "The import process's details."
/// }
library;

import 'exports.dart';
part 'admin_import_product_response.freezed.dart';
part 'admin_import_product_response.g.dart'; // AdminImportProductResponse

@freezed
abstract class AdminImportProductResponse with _$AdminImportProductResponse {
  const AdminImportProductResponse._();

  @jsonSerializable
  const factory AdminImportProductResponse({
    /// transactionId
    @JsonKey(name: AdminImportProductResponse.transactionIdKey)
    required String transactionId,

    /// summary
    @JsonKey(name: AdminImportProductResponse.summaryKey)
    required Map<String, dynamic> summary,
  }) = _AdminImportProductResponse;

  factory AdminImportProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminImportProductResponseFromJson(json);

  static const String transactionIdKey = r'transaction_id';

  static const String summaryKey = r'summary';
}
