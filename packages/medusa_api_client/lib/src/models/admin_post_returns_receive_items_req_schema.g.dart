// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_receive_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostReturnsReceiveItemsReqSchema
_$AdminPostReturnsReceiveItemsReqSchemaFromJson(Map<String, dynamic> json) =>
    _AdminPostReturnsReceiveItemsReqSchema(
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$AdminPostReturnsReceiveItemsReqSchemaToJson(
  _AdminPostReturnsReceiveItemsReqSchema instance,
) => <String, dynamic>{'items': instance.items};
