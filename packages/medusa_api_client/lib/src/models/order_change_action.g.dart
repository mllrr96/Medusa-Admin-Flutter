// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_change_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderChangeAction _$OrderChangeActionFromJson(Map<String, dynamic> json) =>
    _OrderChangeAction(
      id: json['id'] as String,
      orderChangeId: json['order_change_id'] as String,
      orderChange: json['order_change'] as Map<String, dynamic>,
      orderId: json['order_id'] as String,
      returnId: json['return_id'] as String,
      claimId: json['claim_id'] as String,
      exchangeId: json['exchange_id'] as String,
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      reference: $enumDecode(_$ReferenceEnumEnumMap, json['reference']),
      referenceId: json['reference_id'] as String,
      action: $enumDecode(_$NullEnumEnumMap, json['action']),
      details: json['details'] as Map<String, dynamic>,
      internalNote: json['internal_note'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OrderChangeActionToJson(_OrderChangeAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_change_id': instance.orderChangeId,
      'order_change': instance.orderChange,
      'order_id': instance.orderId,
      'return_id': instance.returnId,
      'claim_id': instance.claimId,
      'exchange_id': instance.exchangeId,
      'order': instance.order,
      'reference': instance.reference,
      'reference_id': instance.referenceId,
      'action': instance.action,
      'details': instance.details,
      'internal_note': instance.internalNote,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$ReferenceEnumEnumMap = {
  ReferenceEnum.claim: 'claim',
  ReferenceEnum.exchange: 'exchange',
  ReferenceEnum.returnAA: 'return',
  ReferenceEnum.orderShippingMethod: 'order_shipping_method',
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
