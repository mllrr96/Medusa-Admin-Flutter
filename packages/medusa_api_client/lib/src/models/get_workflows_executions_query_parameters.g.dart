// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_workflows_executions_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetWorkflowsExecutionsQueryParametersImpl
_$$GetWorkflowsExecutionsQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetWorkflowsExecutionsQueryParametersImpl(
  fields: json['fields'] as String,
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  transactionId: json['transaction_id'],
  workflowId: json['workflow_id'],
  q: json['q'] as String,
);

Map<String, dynamic> _$$GetWorkflowsExecutionsQueryParametersImplToJson(
  _$GetWorkflowsExecutionsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'transaction_id': instance.transactionId,
  'workflow_id': instance.workflowId,
  'q': instance.q,
};
