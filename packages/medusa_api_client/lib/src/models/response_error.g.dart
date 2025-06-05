// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseErrorImpl _$$ResponseErrorImplFromJson(Map<String, dynamic> json) =>
    _$ResponseErrorImpl(
      code: $enumDecode(_$NullEnumEnumMap, json['code']),
      message: json['message'] as String,
      type: $enumDecode(_$NullEnumEnumMap, json['type']),
    );

Map<String, dynamic> _$$ResponseErrorImplToJson(_$ResponseErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'type': instance.type,
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
