// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return_reason_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminReturnReasonResponse _$AdminReturnReasonResponseFromJson(
  Map<String, dynamic> json,
) => _AdminReturnReasonResponse(
  returnReason: AdminReturnReason.fromJson(
    json['return_reason'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminReturnReasonResponseToJson(
  _AdminReturnReasonResponse instance,
) => <String, dynamic>{'return_reason': instance.returnReason};
