// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_api_key_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminApiKeyResponse _$AdminApiKeyResponseFromJson(Map<String, dynamic> json) =>
    _AdminApiKeyResponse(
      apiKey: AdminApiKey.fromJson(json['api_key'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdminApiKeyResponseToJson(
  _AdminApiKeyResponse instance,
) => <String, dynamic>{'api_key': instance.apiKey};
