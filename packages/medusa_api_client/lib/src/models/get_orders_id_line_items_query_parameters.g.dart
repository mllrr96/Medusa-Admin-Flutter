// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_orders_id_line_items_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetOrdersIdLineItemsQueryParameters
_$GetOrdersIdLineItemsQueryParametersFromJson(Map<String, dynamic> json) =>
    _GetOrdersIdLineItemsQueryParameters(
      fields: json['fields'] as String,
      id: json['id'],
      itemId: json['item_id'],
      orderId: json['order_id'],
      version: json['version'],
      limit: (json['limit'] as num).toDouble(),
      offset: (json['offset'] as num).toDouble(),
      order: json['order'] as String,
    );

Map<String, dynamic> _$GetOrdersIdLineItemsQueryParametersToJson(
  _GetOrdersIdLineItemsQueryParameters instance,
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
