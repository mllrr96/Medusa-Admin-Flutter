// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_exchanges_add_items_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostExchangesAddItemsReqSchemaImpl
_$$AdminPostExchangesAddItemsReqSchemaImplFromJson(Map<String, dynamic> json) =>
    _$AdminPostExchangesAddItemsReqSchemaImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$AdminPostExchangesAddItemsReqSchemaImplToJson(
  _$AdminPostExchangesAddItemsReqSchemaImpl instance,
) => <String, dynamic>{'items': instance.items};
