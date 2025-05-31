// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_exchanges_return_request_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostExchangesReturnRequestItemsReqSchema
_$AdminPostExchangesReturnRequestItemsReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostExchangesReturnRequestItemsReqSchema(
  items: (json['items'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$AdminPostExchangesReturnRequestItemsReqSchemaToJson(
  _AdminPostExchangesReturnRequestItemsReqSchema instance,
) => <String, dynamic>{'items': instance.items};
