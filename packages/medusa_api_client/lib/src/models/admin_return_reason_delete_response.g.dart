// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return_reason_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminReturnReasonDeleteResponseImpl
_$$AdminReturnReasonDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminReturnReasonDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'return_reason',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminReturnReasonDeleteResponseImplToJson(
  _$AdminReturnReasonDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
