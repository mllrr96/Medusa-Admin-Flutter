// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_workflows_async_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreateWorkflowsAsyncResponseImpl
_$$AdminCreateWorkflowsAsyncResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminCreateWorkflowsAsyncResponseImpl(
      transactionId: json['transaction_id'] as String,
      stepId: json['step_id'] as String,
      response: json['response'],
      compensateInput: json['compensate_input'],
      action: $enumDecode(_$NullEnumEnumMap, json['action']),
    );

Map<String, dynamic> _$$AdminCreateWorkflowsAsyncResponseImplToJson(
  _$AdminCreateWorkflowsAsyncResponseImpl instance,
) => <String, dynamic>{
  'transaction_id': instance.transactionId,
  'step_id': instance.stepId,
  'response': instance.response,
  'compensate_input': instance.compensateInput,
  'action': instance.action,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
