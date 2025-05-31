// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_return_reason_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreReturnReasonResponse _$StoreReturnReasonResponseFromJson(
  Map<String, dynamic> json,
) => _StoreReturnReasonResponse(
  returnReason: StoreReturnReason.fromJson(
    json['return_reason'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$StoreReturnReasonResponseToJson(
  _StoreReturnReasonResponse instance,
) => <String, dynamic>{'return_reason': instance.returnReason};
