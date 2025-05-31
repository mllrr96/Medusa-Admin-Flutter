// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_workflow_execution_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminWorkflowExecutionResponse _$AdminWorkflowExecutionResponseFromJson(
  Map<String, dynamic> json,
) => _AdminWorkflowExecutionResponse(
  workflowExecution: AdminWorkflowExecution.fromJson(
    json['workflow_execution'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminWorkflowExecutionResponseToJson(
  _AdminWorkflowExecutionResponse instance,
) => <String, dynamic>{'workflow_execution': instance.workflowExecution};
