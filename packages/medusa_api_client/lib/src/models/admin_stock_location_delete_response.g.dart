// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_stock_location_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminStockLocationDeleteResponseImpl
_$$AdminStockLocationDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminStockLocationDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'stock_location',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminStockLocationDeleteResponseImplToJson(
  _$AdminStockLocationDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
