// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_file_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminFileListResponseImpl _$$AdminFileListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminFileListResponseImpl(
  files: (json['files'] as List<dynamic>)
      .map((e) => AdminFile.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AdminFileListResponseImplToJson(
  _$AdminFileListResponseImpl instance,
) => <String, dynamic>{'files': instance.files};
