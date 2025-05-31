// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_order_edits_add_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostOrderEditsAddItemsReqSchema
_$AdminPostOrderEditsAddItemsReqSchemaFromJson(Map<String, dynamic> json) =>
    _AdminPostOrderEditsAddItemsReqSchema(
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$AdminPostOrderEditsAddItemsReqSchemaToJson(
  _AdminPostOrderEditsAddItemsReqSchema instance,
) => <String, dynamic>{'items': instance.items};
