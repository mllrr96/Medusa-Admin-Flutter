// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_id_line_items_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetOrdersIdLineItemsQueryParametersImpl
_$$GetOrdersIdLineItemsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetOrdersIdLineItemsQueryParametersImpl(
      fields: json['fields'] as String,
      id: json['id'],
      itemId: json['item_id'],
      orderId: json['order_id'],
      version: json['version'],
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      order: json['order'] as String,
    );

Map<String, dynamic> _$$GetOrdersIdLineItemsQueryParametersImplToJson(
  _$GetOrdersIdLineItemsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'id': instance.id,
  'item_id': instance.itemId,
  'order_id': instance.orderId,
  'version': instance.version,
  'limit': instance.limit,
  'offset': instance.offset,
  'order': instance.order,
};
