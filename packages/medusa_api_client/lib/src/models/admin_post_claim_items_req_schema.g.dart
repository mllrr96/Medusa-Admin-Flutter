// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_claim_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostClaimItemsReqSchema _$AdminPostClaimItemsReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostClaimItemsReqSchema(
  items: (json['items'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$AdminPostClaimItemsReqSchemaToJson(
  _AdminPostClaimItemsReqSchema instance,
) => <String, dynamic>{'items': instance.items};
