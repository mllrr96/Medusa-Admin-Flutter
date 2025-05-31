// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_workflows_executions_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetWorkflowsExecutionsQueryParameters
_$GetWorkflowsExecutionsQueryParametersFromJson(Map<String, dynamic> json) =>
    _GetWorkflowsExecutionsQueryParameters(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toDouble(),
      limit: (json['limit'] as num).toDouble(),
      order: json['order'] as String,
      transactionId: json['transaction_id'],
      workflowId: json['workflow_id'],
      q: json['q'] as String,
    );

Map<String, dynamic> _$GetWorkflowsExecutionsQueryParametersToJson(
  _GetWorkflowsExecutionsQueryParameters instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'transaction_id': instance.transactionId,
  'workflow_id': instance.workflowId,
  'q': instance.q,
};
