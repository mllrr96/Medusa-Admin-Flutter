// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_request_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostReturnsRequestItemsReqSchema
_$AdminPostReturnsRequestItemsReqSchemaFromJson(Map<String, dynamic> json) =>
    _AdminPostReturnsRequestItemsReqSchema(
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$AdminPostReturnsRequestItemsReqSchemaToJson(
  _AdminPostReturnsRequestItemsReqSchema instance,
) => <String, dynamic>{'items': instance.items};
