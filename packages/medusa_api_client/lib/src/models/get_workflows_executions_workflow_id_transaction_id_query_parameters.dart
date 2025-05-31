/// GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_workflows_executions_workflow_id_transaction_id_query_parameters.freezed.dart';
part 'get_workflows_executions_workflow_id_transaction_id_query_parameters.g.dart'; // GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParameters

@freezed
abstract class GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParameters
    with _$GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParameters {
  const GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParameters._();

  @jsonSerializable
  const factory GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParameters({
    /// fields
    @JsonKey(
      name: GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParameters
          .fieldsKey,
    )
    required String fields,
  }) = _GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParameters;

  factory GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetWorkflowsExecutionsWorkflowIdTransactionIdQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
