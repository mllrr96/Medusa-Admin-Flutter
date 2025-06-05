// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_execution_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkflowExecutionContextImpl _$$WorkflowExecutionContextImplFromJson(
  Map<String, dynamic> json,
) => _$WorkflowExecutionContextImpl(
  data: json['data'] as Map<String, dynamic>,
  compensate: json['compensate'] as Map<String, dynamic>,
  errors: (json['errors'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$WorkflowExecutionContextImplToJson(
  _$WorkflowExecutionContextImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'compensate': instance.compensate,
  'errors': instance.errors,
};
