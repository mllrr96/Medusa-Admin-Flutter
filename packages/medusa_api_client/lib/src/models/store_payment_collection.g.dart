// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_payment_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StorePaymentCollection _$StorePaymentCollectionFromJson(
  Map<String, dynamic> json,
) => _StorePaymentCollection(
  id: json['id'] as String,
  currencyCode: json['currency_code'] as String,
  amount: (json['amount'] as num).toDouble(),
  authorizedAmount: (json['authorized_amount'] as num).toDouble(),
  capturedAmount: (json['captured_amount'] as num).toDouble(),
  refundedAmount: (json['refunded_amount'] as num).toDouble(),
  completedAt: DateTime.parse(json['completed_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>,
  status: $enumDecode(_$NullEnumEnumMap, json['status']),
  paymentProviders: (json['payment_providers'] as List<dynamic>)
      .map((e) => StorePaymentProvider.fromJson(e as Map<String, dynamic>))
      .toList(),
  paymentSessions: (json['payment_sessions'] as List<dynamic>)
      .map((e) => StorePaymentSession.fromJson(e as Map<String, dynamic>))
      .toList(),
  payments: (json['payments'] as List<dynamic>)
      .map((e) => BasePayment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StorePaymentCollectionToJson(
  _StorePaymentCollection instance,
) => <String, dynamic>{
  'id': instance.id,
  'currency_code': instance.currencyCode,
  'amount': instance.amount,
  'authorized_amount': instance.authorizedAmount,
  'captured_amount': instance.capturedAmount,
  'refunded_amount': instance.refundedAmount,
  'completed_at': instance.completedAt.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'metadata': instance.metadata,
  'status': instance.status,
  'payment_providers': instance.paymentProviders,
  'payment_sessions': instance.paymentSessions,
  'payments': instance.payments,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
