// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminClaimDeleteResponse _$AdminClaimDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminClaimDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'claim',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminClaimDeleteResponseToJson(
  _AdminClaimDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
