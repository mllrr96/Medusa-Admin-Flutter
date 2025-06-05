// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_claim_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostClaimItemsReqSchemaImpl _$$AdminPostClaimItemsReqSchemaImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPostClaimItemsReqSchemaImpl(
  items: (json['items'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$AdminPostClaimItemsReqSchemaImplToJson(
  _$AdminPostClaimItemsReqSchemaImpl instance,
) => <String, dynamic>{'items': instance.items};
