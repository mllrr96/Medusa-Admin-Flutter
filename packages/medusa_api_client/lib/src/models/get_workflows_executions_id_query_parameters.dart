/// GetWorkflowsExecutionsIdQueryParameters
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
part 'get_workflows_executions_id_query_parameters.freezed.dart';
part 'get_workflows_executions_id_query_parameters.g.dart'; // GetWorkflowsExecutionsIdQueryParameters

@freezed
abstract class GetWorkflowsExecutionsIdQueryParameters
    with _$GetWorkflowsExecutionsIdQueryParameters {
  const GetWorkflowsExecutionsIdQueryParameters._();

  @jsonSerializable
  const factory GetWorkflowsExecutionsIdQueryParameters({
    /// fields
    @JsonKey(name: GetWorkflowsExecutionsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetWorkflowsExecutionsIdQueryParameters;

  factory GetWorkflowsExecutionsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetWorkflowsExecutionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
