// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResponseError _$ResponseErrorFromJson(Map<String, dynamic> json) =>
    _ResponseError(
      code: $enumDecode(_$NullEnumEnumMap, json['code']),
      message: json['message'] as String,
      type: $enumDecode(_$NullEnumEnumMap, json['type']),
    );

Map<String, dynamic> _$ResponseErrorToJson(_ResponseError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'type': instance.type,
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
