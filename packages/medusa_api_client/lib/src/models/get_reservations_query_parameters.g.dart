// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reservations_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetReservationsQueryParametersImpl
_$$GetReservationsQueryParametersImplFromJson(Map<String, dynamic> json) =>
    _$GetReservationsQueryParametersImpl(
      fields: json['fields'] as String,
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      order: json['order'] as String,
      locationId: json['location_id'],
      inventoryItemId: json['inventory_item_id'],
      lineItemId: json['line_item_id'],
      createdBy: json['created_by'],
      description: json['description'],
      createdAt: json['created_at'] as Map<String, dynamic>,
      updatedAt: json['updated_at'] as Map<String, dynamic>,
      deletedAt: json['deleted_at'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$GetReservationsQueryParametersImplToJson(
  _$GetReservationsQueryParametersImpl instance,
) => <String, dynamic>{
  'fields': instance.fields,
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'location_id': instance.locationId,
  'inventory_item_id': instance.inventoryItemId,
  'line_item_id': instance.lineItemId,
  'created_by': instance.createdBy,
  'description': instance.description,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
};
