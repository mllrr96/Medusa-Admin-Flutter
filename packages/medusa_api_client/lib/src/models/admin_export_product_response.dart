/// AdminExportProductResponse
/// {
///     "properties": {
///         "transaction_id": {
///             "type": "string",
///             "description": "The ID of the workflow execution's transaction. Use it to check the status of the export by sending a GET request to `/admin/workflows-executions/export-products/:transaction-id`",
///             "title": "transaction_id"
///         }
///     },
///     "type": "object",
///     "required": [
///         "transaction_id"
///     ],
///     "description": "The details of the product export."
/// }
library;

import 'exports.dart';
part 'admin_export_product_response.freezed.dart';
part 'admin_export_product_response.g.dart'; // AdminExportProductResponse

@freezed
abstract class AdminExportProductResponse with _$AdminExportProductResponse {
  const AdminExportProductResponse._();

  @jsonSerializable
  const factory AdminExportProductResponse({
    /// transactionId
    @JsonKey(name: AdminExportProductResponse.transactionIdKey)
    required String transactionId,
  }) = _AdminExportProductResponse;

  factory AdminExportProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminExportProductResponseFromJson(json);

  static const String transactionIdKey = r'transaction_id';
}
