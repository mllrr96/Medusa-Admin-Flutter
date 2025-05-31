// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_file_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminFileListResponse _$AdminFileListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminFileListResponse(
  files: (json['files'] as List<dynamic>)
      .map((e) => AdminFile.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AdminFileListResponseToJson(
  _AdminFileListResponse instance,
) => <String, dynamic>{'files': instance.files};
