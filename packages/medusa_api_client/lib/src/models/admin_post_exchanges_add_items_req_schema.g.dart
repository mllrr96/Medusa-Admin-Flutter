// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_exchanges_add_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostExchangesAddItemsReqSchema
_$AdminPostExchangesAddItemsReqSchemaFromJson(Map<String, dynamic> json) =>
    _AdminPostExchangesAddItemsReqSchema(
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$AdminPostExchangesAddItemsReqSchemaToJson(
  _AdminPostExchangesAddItemsReqSchema instance,
) => <String, dynamic>{'items': instance.items};
