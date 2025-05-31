// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductTypeResponse _$AdminProductTypeResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductTypeResponse(
  productType: AdminProductType.fromJson(
    json['product_type'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminProductTypeResponseToJson(
  _AdminProductTypeResponse instance,
) => <String, dynamic>{'product_type': instance.productType};
