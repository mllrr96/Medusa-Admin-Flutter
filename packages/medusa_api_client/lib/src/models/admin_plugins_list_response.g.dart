// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_plugins_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPluginsListResponse _$AdminPluginsListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminPluginsListResponse(
  plugins: (json['plugins'] as List<dynamic>)
      .map((e) => AdminPlugin.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AdminPluginsListResponseToJson(
  _AdminPluginsListResponse instance,
) => <String, dynamic>{'plugins': instance.plugins};
