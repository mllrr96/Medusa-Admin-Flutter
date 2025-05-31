// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_order_credit_lines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateOrderCreditLines _$AdminCreateOrderCreditLinesFromJson(
  Map<String, dynamic> json,
) => _AdminCreateOrderCreditLines(
  amount: (json['amount'] as num).toDouble(),
  reference: json['reference'] as String,
  referenceId: json['reference_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminCreateOrderCreditLinesToJson(
  _AdminCreateOrderCreditLines instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'reference': instance.reference,
  'reference_id': instance.referenceId,
  'metadata': instance.metadata,
};
