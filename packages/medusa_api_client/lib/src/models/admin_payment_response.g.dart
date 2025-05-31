// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPaymentResponse _$AdminPaymentResponseFromJson(
  Map<String, dynamic> json,
) => _AdminPaymentResponse(
  payment: AdminPayment.fromJson(json['payment'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminPaymentResponseToJson(
  _AdminPaymentResponse instance,
) => <String, dynamic>{'payment': instance.payment};
