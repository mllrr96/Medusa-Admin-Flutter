// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_collection_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCollectionDeleteResponseImpl
_$$AdminCollectionDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminCollectionDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'collection',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminCollectionDeleteResponseImplToJson(
  _$AdminCollectionDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
