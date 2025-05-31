// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_collection_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCollectionDeleteResponse _$AdminCollectionDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminCollectionDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'collection',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminCollectionDeleteResponseToJson(
  _AdminCollectionDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
