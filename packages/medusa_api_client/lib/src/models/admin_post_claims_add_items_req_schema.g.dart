// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_claims_add_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostClaimsAddItemsReqSchema _$AdminPostClaimsAddItemsReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostClaimsAddItemsReqSchema(
  items: (json['items'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$AdminPostClaimsAddItemsReqSchemaToJson(
  _AdminPostClaimsAddItemsReqSchema instance,
) => <String, dynamic>{'items': instance.items};
