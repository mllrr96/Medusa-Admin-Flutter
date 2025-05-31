// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_initialize_payment_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreInitializePaymentSession _$StoreInitializePaymentSessionFromJson(
  Map<String, dynamic> json,
) => _StoreInitializePaymentSession(
  providerId: json['provider_id'] as String,
  data: json['data'] as Map<String, dynamic>,
);

Map<String, dynamic> _$StoreInitializePaymentSessionToJson(
  _StoreInitializePaymentSession instance,
) => <String, dynamic>{
  'provider_id': instance.providerId,
  'data': instance.data,
};
