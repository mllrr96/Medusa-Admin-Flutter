// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminClaimDeleteResponseImpl _$$AdminClaimDeleteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminClaimDeleteResponseImpl(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'claim',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$$AdminClaimDeleteResponseImplToJson(
  _$AdminClaimDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
