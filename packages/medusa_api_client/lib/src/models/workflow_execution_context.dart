/// WorkflowExecutionContext
/// {
///     "properties": {
///         "data": {
///             "type": "object",
///             "description": "The context's data."
///         },
///         "compensate": {
///             "type": "object",
///             "description": "The context's compensate."
///         },
///         "errors": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "The error's details."
///             },
///             "description": "The context's errors."
///         }
///     },
///     "type": "object",
///     "required": [
///         "compensate",
///         "errors"
///     ],
///     "description": "The workflow execution's context."
/// }
library workflow_execution_context;

import 'exports.dart';
part 'workflow_execution_context.freezed.dart';
part 'workflow_execution_context.g.dart'; // WorkflowExecutionContext

@freezed
abstract class WorkflowExecutionContext with _$WorkflowExecutionContext {
  const WorkflowExecutionContext._();

  @jsonSerializable
  const factory WorkflowExecutionContext({
    /// data
    @JsonKey(name: WorkflowExecutionContext.dataKey)
    required Map<String, dynamic> data,

    /// compensate
    @JsonKey(name: WorkflowExecutionContext.compensateKey)
    required Map<String, dynamic> compensate,

    /// errors
    @JsonKey(name: WorkflowExecutionContext.errorsKey)
    required List<Map<String, dynamic>> errors,
  }) = _WorkflowExecutionContext;

  factory WorkflowExecutionContext.fromJson(Map<String, dynamic> json) =>
      _$WorkflowExecutionContextFromJson(json);

  static const String dataKey = r'data';

  static const String compensateKey = r'compensate';

  static const String errorsKey = r'errors';
}
