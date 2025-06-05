// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_reason_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefundReasonResponseImpl _$$RefundReasonResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RefundReasonResponseImpl(
  refundReason: AdminRefundReason.fromJson(
    json['refund_reason'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$RefundReasonResponseImplToJson(
  _$RefundReasonResponseImpl instance,
) => <String, dynamic>{'refund_reason': instance.refundReason};
