// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_payment_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPaymentSessionImpl _$$AdminPaymentSessionImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPaymentSessionImpl(
  id: json['id'] as String,
  amount: (json['amount'] as num).toDouble(),
  currencyCode: json['currency_code'] as String,
  providerId: json['provider_id'] as String,
  data: json['data'] as Map<String, dynamic>,
  context: json['context'] as Map<String, dynamic>,
  status: $enumDecode(_$NullEnumEnumMap, json['status']),
  authorizedAt: DateTime.parse(json['authorized_at'] as String),
  paymentCollection: json['payment_collection'] as Map<String, dynamic>,
  payment: BasePayment.fromJson(json['payment'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminPaymentSessionImplToJson(
  _$AdminPaymentSessionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'currency_code': instance.currencyCode,
  'provider_id': instance.providerId,
  'data': instance.data,
  'context': instance.context,
  'status': instance.status,
  'authorized_at': instance.authorizedAt.toIso8601String(),
  'payment_collection': instance.paymentCollection,
  'payment': instance.payment,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
