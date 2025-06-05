/// AdminWorkflowExecution
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The workflow execution's ID.",
///             "title": "id"
///         },
///         "workflow_id": {
///             "type": "string",
///             "description": "The ID of the workflow.",
///             "title": "workflow_id"
///         },
///         "transaction_id": {
///             "type": "string",
///             "description": "The workflow execution's transaction ID.",
///             "title": "transaction_id"
///         },
///         "execution": {
///             "$ref": "#/components/schemas/AdminWorkflowExecutionExecution"
///         },
///         "context": {
///             "$ref": "#/components/schemas/WorkflowExecutionContext"
///         },
///         "state": {
///             "enum": [
///                 "not_started",
///                 "invoking",
///                 "waiting_to_compensate",
///                 "compensating",
///                 "done",
///                 "reverted",
///                 "failed"
///             ],
///             "type": "string",
///             "description": "The workflow execution's state."
///         },
///         "created_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the workflow execution was created.",
///             "title": "created_at"
///         },
///         "updated_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the workflow execution was updated.",
///             "title": "updated_at"
///         },
///         "deleted_at": {
///             "type": "string",
///             "format": "date-time",
///             "description": "The date the workflow execution was deleted.",
///             "title": "deleted_at"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "workflow_id",
///         "transaction_id",
///         "execution",
///         "context",
///         "state",
///         "created_at",
///         "updated_at"
///     ],
///     "description": "The workflows execution's details."
/// }
library;

import 'exports.dart';
part 'admin_workflow_execution.freezed.dart';
part 'admin_workflow_execution.g.dart'; // AdminWorkflowExecution

@freezed
abstract class AdminWorkflowExecution with _$AdminWorkflowExecution {
  const AdminWorkflowExecution._();

  @jsonSerializable
  const factory AdminWorkflowExecution({
    /// id
    @JsonKey(name: AdminWorkflowExecution.idKey) required String id,

    /// workflowId
    @JsonKey(name: AdminWorkflowExecution.workflowIdKey)
    required String workflowId,

    /// transactionId
    @JsonKey(name: AdminWorkflowExecution.transactionIdKey)
    required String transactionId,

    /// execution
    @JsonKey(name: AdminWorkflowExecution.executionKey)
    required AdminWorkflowExecutionExecution execution,

    /// context
    @JsonKey(name: AdminWorkflowExecution.contextKey)
    required WorkflowExecutionContext context,

    /// state
    @JsonKey(name: AdminWorkflowExecution.stateKey) required NullEnum state,

    /// createdAt
    @JsonKey(name: AdminWorkflowExecution.createdAtKey)
    required DateTime createdAt,

    /// updatedAt
    @JsonKey(name: AdminWorkflowExecution.updatedAtKey)
    required DateTime updatedAt,

    /// deletedAt
    @JsonKey(name: AdminWorkflowExecution.deletedAtKey)
    required DateTime deletedAt,
  }) = _AdminWorkflowExecution;

  factory AdminWorkflowExecution.fromJson(Map<String, dynamic> json) =>
      _$AdminWorkflowExecutionFromJson(json);

  static const String idKey = r'id';

  static const String workflowIdKey = r'workflow_id';

  static const String transactionIdKey = r'transaction_id';

  static const String executionKey = r'execution';

  static const String contextKey = r'context';

  static const String stateKey = r'state';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
