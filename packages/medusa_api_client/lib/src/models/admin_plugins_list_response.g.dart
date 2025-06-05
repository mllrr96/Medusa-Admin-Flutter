// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_plugins_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPluginsListResponseImpl _$$AdminPluginsListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPluginsListResponseImpl(
  plugins: (json['plugins'] as List<dynamic>)
      .map((e) => AdminPlugin.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AdminPluginsListResponseImplToJson(
  _$AdminPluginsListResponseImpl instance,
) => <String, dynamic>{'plugins': instance.plugins};
