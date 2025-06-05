// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_order_edits_add_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostOrderEditsAddItemsReqSchemaImpl
_$$AdminPostOrderEditsAddItemsReqSchemaImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPostOrderEditsAddItemsReqSchemaImpl(
  items: (json['items'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$AdminPostOrderEditsAddItemsReqSchemaImplToJson(
  _$AdminPostOrderEditsAddItemsReqSchemaImpl instance,
) => <String, dynamic>{'items': instance.items};
