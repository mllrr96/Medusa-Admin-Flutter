/// AdminCreateWorkflowsAsyncResponse
/// {
///     "properties": {
///         "transaction_id": {
///             "type": "string",
///             "description": "The workflows execution's transaction ID.",
///             "title": "transaction_id"
///         },
///         "step_id": {
///             "type": "string",
///             "description": "The ID of the step whose status was changed.",
///             "title": "step_id"
///         },
///         "response": {
///             "description": "Sets the step's response. It accepts any type."
///         },
///         "compensate_input": {
///             "description": "Sets the compensation function's input. It accepts any response."
///         },
///         "action": {
///             "enum": [
///                 "invoke",
///                 "compensate"
///             ],
///             "type": "string",
///             "description": "Whether to invoke or compensate the step."
///         }
///     },
///     "type": "object",
///     "required": [
///         "transaction_id",
///         "step_id"
///     ],
///     "description": "The details of changing a workflow execution's step status."
/// }
library;

import 'exports.dart';
part 'admin_create_workflows_async_response.freezed.dart';
part 'admin_create_workflows_async_response.g.dart'; // AdminCreateWorkflowsAsyncResponse

@freezed
abstract class AdminCreateWorkflowsAsyncResponse
    with _$AdminCreateWorkflowsAsyncResponse {
  const AdminCreateWorkflowsAsyncResponse._();

  @jsonSerializable
  const factory AdminCreateWorkflowsAsyncResponse({
    /// transactionId
    @JsonKey(name: AdminCreateWorkflowsAsyncResponse.transactionIdKey)
    required String transactionId,

    /// stepId
    @JsonKey(name: AdminCreateWorkflowsAsyncResponse.stepIdKey)
    required String stepId,

    /// response
    @JsonKey(name: AdminCreateWorkflowsAsyncResponse.responseKey)
    required dynamic response,

    /// compensateInput
    @JsonKey(name: AdminCreateWorkflowsAsyncResponse.compensateInputKey)
    required dynamic compensateInput,

    /// action
    @JsonKey(name: AdminCreateWorkflowsAsyncResponse.actionKey)
    required NullEnum action,
  }) = _AdminCreateWorkflowsAsyncResponse;

  factory AdminCreateWorkflowsAsyncResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminCreateWorkflowsAsyncResponseFromJson(json);

  static const String transactionIdKey = r'transaction_id';

  static const String stepIdKey = r'step_id';

  static const String responseKey = r'response';

  static const String compensateInputKey = r'compensate_input';

  static const String actionKey = r'action';
}
