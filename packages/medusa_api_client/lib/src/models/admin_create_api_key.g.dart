// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_api_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateApiKey _$AdminCreateApiKeyFromJson(Map<String, dynamic> json) =>
    _AdminCreateApiKey(
      title: json['title'] as String,
      type: $enumDecode(_$NullEnumEnumMap, json['type']),
    );

Map<String, dynamic> _$AdminCreateApiKeyToJson(_AdminCreateApiKey instance) =>
    <String, dynamic>{'title': instance.title, 'type': instance.type};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
