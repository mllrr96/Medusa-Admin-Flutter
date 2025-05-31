// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_execution_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkflowExecutionContext _$WorkflowExecutionContextFromJson(
  Map<String, dynamic> json,
) => _WorkflowExecutionContext(
  data: json['data'] as Map<String, dynamic>,
  compensate: json['compensate'] as Map<String, dynamic>,
  errors: (json['errors'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$WorkflowExecutionContextToJson(
  _WorkflowExecutionContext instance,
) => <String, dynamic>{
  'data': instance.data,
  'compensate': instance.compensate,
  'errors': instance.errors,
};
