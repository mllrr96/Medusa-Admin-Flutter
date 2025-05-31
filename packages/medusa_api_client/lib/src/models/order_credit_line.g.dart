// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_credit_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderCreditLine _$OrderCreditLineFromJson(Map<String, dynamic> json) =>
    _OrderCreditLine(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      order: json['order'] as Map<String, dynamic>,
      reference: json['reference'] as String,
      referenceId: json['reference_id'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderCreditLineToJson(_OrderCreditLine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'order': instance.order,
      'reference': instance.reference,
      'reference_id': instance.referenceId,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'amount': instance.amount,
    };
