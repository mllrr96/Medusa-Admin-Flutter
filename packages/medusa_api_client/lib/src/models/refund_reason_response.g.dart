// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_reason_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefundReasonResponse _$RefundReasonResponseFromJson(
  Map<String, dynamic> json,
) => _RefundReasonResponse(
  refundReason: AdminRefundReason.fromJson(
    json['refund_reason'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$RefundReasonResponseToJson(
  _RefundReasonResponse instance,
) => <String, dynamic>{'refund_reason': instance.refundReason};
