// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_request_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostReturnsRequestItemsReqSchemaImpl
_$$AdminPostReturnsRequestItemsReqSchemaImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPostReturnsRequestItemsReqSchemaImpl(
  items: (json['items'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$AdminPostReturnsRequestItemsReqSchemaImplToJson(
  _$AdminPostReturnsRequestItemsReqSchemaImpl instance,
) => <String, dynamic>{'items': instance.items};
