// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasePayment _$BasePaymentFromJson(Map<String, dynamic> json) => _BasePayment(
  id: json['id'] as String,
  amount: (json['amount'] as num).toDouble(),
  authorizedAmount: (json['authorized_amount'] as num).toDouble(),
  currencyCode: json['currency_code'] as String,
  providerId: json['provider_id'] as String,
  data: json['data'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  capturedAt: DateTime.parse(json['captured_at'] as String),
  canceledAt: DateTime.parse(json['canceled_at'] as String),
  capturedAmount: (json['captured_amount'] as num).toDouble(),
  refundedAmount: (json['refunded_amount'] as num).toDouble(),
  captures: (json['captures'] as List<dynamic>)
      .map((e) => BaseCapture.fromJson(e as Map<String, dynamic>))
      .toList(),
  refunds: (json['refunds'] as List<dynamic>)
      .map((e) => BaseRefund.fromJson(e as Map<String, dynamic>))
      .toList(),
  paymentCollection: json['payment_collection'] as Map<String, dynamic>,
  paymentSession: json['payment_session'] as Map<String, dynamic>,
);

Map<String, dynamic> _$BasePaymentToJson(_BasePayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'authorized_amount': instance.authorizedAmount,
      'currency_code': instance.currencyCode,
      'provider_id': instance.providerId,
      'data': instance.data,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'captured_at': instance.capturedAt.toIso8601String(),
      'canceled_at': instance.canceledAt.toIso8601String(),
      'captured_amount': instance.capturedAmount,
      'refunded_amount': instance.refundedAmount,
      'captures': instance.captures,
      'refunds': instance.refunds,
      'payment_collection': instance.paymentCollection,
      'payment_session': instance.paymentSession,
    };
