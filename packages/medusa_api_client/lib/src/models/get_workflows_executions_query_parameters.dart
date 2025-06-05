/// GetWorkflowsExecutionsQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items to skip when retrieving a list.",
///             "title": "offset"
///         },
///         "limit": {
///             "type": "number",
///             "description": "Limit the number of items returned in the list.",
///             "title": "limit"
///         },
///         "order": {
///             "type": "string",
///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
///             "title": "order"
///         },
///         "transaction_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a transaction ID.",
///                     "title": "transaction_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A transaction ID.",
///                         "title": "transaction_id"
///                     },
///                     "description": "Filter by transaction IDs."
///                 }
///             ]
///         },
///         "workflow_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a workflow ID.",
///                     "title": "workflow_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A workflow ID.",
///                         "title": "workflow_id"
///                     },
///                     "description": "Filter by workflow IDs."
///                 }
///             ]
///         },
///         "q": {
///             "type": "string",
///             "description": "Search query to filter by a workflow execution's searchable fields.",
///             "title": "q"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_workflows_executions_query_parameters.freezed.dart';
part 'get_workflows_executions_query_parameters.g.dart'; // GetWorkflowsExecutionsQueryParameters

@freezed
abstract class GetWorkflowsExecutionsQueryParameters
    with _$GetWorkflowsExecutionsQueryParameters {
  const GetWorkflowsExecutionsQueryParameters._();

  @jsonSerializable
  const factory GetWorkflowsExecutionsQueryParameters({
    /// fields
    @JsonKey(name: GetWorkflowsExecutionsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetWorkflowsExecutionsQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetWorkflowsExecutionsQueryParameters.limitKey)
    required int limit,

    /// order
    @JsonKey(name: GetWorkflowsExecutionsQueryParameters.orderKey)
    required String order,

    /// transactionId
    @JsonKey(name: GetWorkflowsExecutionsQueryParameters.transactionIdKey)
    required dynamic transactionId,

    /// workflowId
    @JsonKey(name: GetWorkflowsExecutionsQueryParameters.workflowIdKey)
    required dynamic workflowId,

    /// q
    @JsonKey(name: GetWorkflowsExecutionsQueryParameters.qKey)
    required String q,
  }) = _GetWorkflowsExecutionsQueryParameters;

  factory GetWorkflowsExecutionsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetWorkflowsExecutionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String transactionIdKey = r'transaction_id';

  static const String workflowIdKey = r'workflow_id';

  static const String qKey = r'q';
}
