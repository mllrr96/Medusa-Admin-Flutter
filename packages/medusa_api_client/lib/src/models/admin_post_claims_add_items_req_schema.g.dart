// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_claims_add_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostClaimsAddItemsReqSchemaImpl
_$$AdminPostClaimsAddItemsReqSchemaImplFromJson(Map<String, dynamic> json) =>
    _$AdminPostClaimsAddItemsReqSchemaImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$AdminPostClaimsAddItemsReqSchemaImplToJson(
  _$AdminPostClaimsAddItemsReqSchemaImpl instance,
) => <String, dynamic>{'items': instance.items};
