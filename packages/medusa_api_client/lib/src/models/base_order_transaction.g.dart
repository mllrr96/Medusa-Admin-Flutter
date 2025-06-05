// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_order_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseOrderTransactionImpl _$$BaseOrderTransactionImplFromJson(
  Map<String, dynamic> json,
) => _$BaseOrderTransactionImpl(
  id: json['id'] as String,
  orderId: json['order_id'] as String,
  amount: (json['amount'] as num).toDouble(),
  currencyCode: json['currency_code'] as String,
  reference: $enumDecode(_$ReferenceEnumEnumMap, json['reference']),
  referenceId: json['reference_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$$BaseOrderTransactionImplToJson(
  _$BaseOrderTransactionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'order_id': instance.orderId,
  'amount': instance.amount,
  'currency_code': instance.currencyCode,
  'reference': instance.reference,
  'reference_id': instance.referenceId,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$ReferenceEnumEnumMap = {
  ReferenceEnum.claim: 'claim',
  ReferenceEnum.exchange: 'exchange',
  ReferenceEnum.returnAA: 'return',
  ReferenceEnum.orderShippingMethod: 'order_shipping_method',
};
