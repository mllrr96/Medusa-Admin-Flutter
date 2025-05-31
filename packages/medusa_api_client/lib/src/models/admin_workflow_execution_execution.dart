/// AdminWorkflowExecutionExecution
/// {
///     "properties": {
///         "steps": {
///             "type": "object",
///             "description": "The execution's steps. Each object key is a step ID, and the value is the object whose properties are shown below."
///         }
///     },
///     "type": "object",
///     "required": [
///         "steps"
///     ],
///     "description": "The workflow execution's steps details."
/// }
library;

import 'exports.dart';
part 'admin_workflow_execution_execution.freezed.dart';
part 'admin_workflow_execution_execution.g.dart'; // AdminWorkflowExecutionExecution

@freezed
abstract class AdminWorkflowExecutionExecution
    with _$AdminWorkflowExecutionExecution {
  const AdminWorkflowExecutionExecution._();

  @jsonSerializable
  const factory AdminWorkflowExecutionExecution({
    /// steps
    @JsonKey(name: AdminWorkflowExecutionExecution.stepsKey)
    required Map<String, dynamic> steps,
  }) = _AdminWorkflowExecutionExecution;

  factory AdminWorkflowExecutionExecution.fromJson(Map<String, dynamic> json) =>
      _$AdminWorkflowExecutionExecutionFromJson(json);

  static const String stepsKey = r'steps';
}
