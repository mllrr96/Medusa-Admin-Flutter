/// AdminWorkflowExecutionResponse
/// {
///     "properties": {
///         "workflow_execution": {
///             "$ref": "#/components/schemas/AdminWorkflowExecution"
///         }
///     },
///     "type": "object",
///     "required": [
///         "workflow_execution"
///     ],
///     "description": "The workflow execution's details."
/// }
library;

import 'exports.dart';
part 'admin_workflow_execution_response.freezed.dart';
part 'admin_workflow_execution_response.g.dart'; // AdminWorkflowExecutionResponse

@freezed
abstract class AdminWorkflowExecutionResponse
    with _$AdminWorkflowExecutionResponse {
  const AdminWorkflowExecutionResponse._();

  @jsonSerializable
  const factory AdminWorkflowExecutionResponse({
    /// workflowExecution
    @JsonKey(name: AdminWorkflowExecutionResponse.workflowExecutionKey)
    required AdminWorkflowExecution workflowExecution,
  }) = _AdminWorkflowExecutionResponse;

  factory AdminWorkflowExecutionResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminWorkflowExecutionResponseFromJson(json);

  static const String workflowExecutionKey = r'workflow_execution';
}
