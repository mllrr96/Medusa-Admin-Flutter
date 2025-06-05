// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_workflow_execution_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminWorkflowExecutionResponseImpl
_$$AdminWorkflowExecutionResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminWorkflowExecutionResponseImpl(
      workflowExecution: AdminWorkflowExecution.fromJson(
        json['workflow_execution'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$AdminWorkflowExecutionResponseImplToJson(
  _$AdminWorkflowExecutionResponseImpl instance,
) => <String, dynamic>{'workflow_execution': instance.workflowExecution};
