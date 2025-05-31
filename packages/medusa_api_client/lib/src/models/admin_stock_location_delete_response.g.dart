// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_stock_location_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminStockLocationDeleteResponse _$AdminStockLocationDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminStockLocationDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'stock_location',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminStockLocationDeleteResponseToJson(
  _AdminStockLocationDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
