// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_order_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseOrderSummaryImpl _$$BaseOrderSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$BaseOrderSummaryImpl(
  paidTotal: (json['paid_total'] as num).toDouble(),
  refundedTotal: (json['refunded_total'] as num).toDouble(),
  pendingDifference: (json['pending_difference'] as num).toDouble(),
  currentOrderTotal: (json['current_order_total'] as num).toDouble(),
  originalOrderTotal: (json['original_order_total'] as num).toDouble(),
  transactionTotal: (json['transaction_total'] as num).toDouble(),
  accountingTotal: (json['accounting_total'] as num).toDouble(),
);

Map<String, dynamic> _$$BaseOrderSummaryImplToJson(
  _$BaseOrderSummaryImpl instance,
) => <String, dynamic>{
  'paid_total': instance.paidTotal,
  'refunded_total': instance.refundedTotal,
  'pending_difference': instance.pendingDifference,
  'current_order_total': instance.currentOrderTotal,
  'original_order_total': instance.originalOrderTotal,
  'transaction_total': instance.transactionTotal,
  'accounting_total': instance.accountingTotal,
};
