// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return_reason_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminReturnReasonDeleteResponse _$AdminReturnReasonDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminReturnReasonDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'return_reason',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminReturnReasonDeleteResponseToJson(
  _AdminReturnReasonDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
