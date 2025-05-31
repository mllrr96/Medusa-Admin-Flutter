/// AdminCreateWorkflowsRun
/// {
///     "properties": {
///         "input": {
///             "description": "The input to pass to the workflow. Can be of any type."
///         },
///         "transaction_id": {
///             "type": "string",
///             "description": "The ID of the workflow execution's transaction.",
///             "title": "transaction_id"
///         }
///     },
///     "type": "object",
///     "description": "The details of the workflow to execute."
/// }
library admin_create_workflows_run;

import 'exports.dart';
part 'admin_create_workflows_run.freezed.dart';
part 'admin_create_workflows_run.g.dart'; // AdminCreateWorkflowsRun

@freezed
abstract class AdminCreateWorkflowsRun with _$AdminCreateWorkflowsRun {
  const AdminCreateWorkflowsRun._();

  @jsonSerializable
  const factory AdminCreateWorkflowsRun({
    /// input
    @JsonKey(name: AdminCreateWorkflowsRun.inputKey) required dynamic input,

    /// transactionId
    @JsonKey(name: AdminCreateWorkflowsRun.transactionIdKey)
    required String transactionId,
  }) = _AdminCreateWorkflowsRun;

  factory AdminCreateWorkflowsRun.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateWorkflowsRunFromJson(json);

  static const String inputKey = r'input';

  static const String transactionIdKey = r'transaction_id';
}
