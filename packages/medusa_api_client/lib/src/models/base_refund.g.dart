// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_refund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseRefund _$BaseRefundFromJson(Map<String, dynamic> json) => _BaseRefund(
  id: json['id'] as String,
  amount: (json['amount'] as num).toDouble(),
  refundReasonId: json['refund_reason_id'] as String,
  note: json['note'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  createdBy: json['created_by'] as String,
  payment: json['payment'] as Map<String, dynamic>,
  refundReason: RefundReason.fromJson(
    json['refund_reason'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$BaseRefundToJson(_BaseRefund instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'refund_reason_id': instance.refundReasonId,
      'note': instance.note,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by': instance.createdBy,
      'payment': instance.payment,
      'refund_reason': instance.refundReason,
    };
