// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreProductTypeResponse _$StoreProductTypeResponseFromJson(
  Map<String, dynamic> json,
) => _StoreProductTypeResponse(
  productType: StoreProductType.fromJson(
    json['product_type'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$StoreProductTypeResponseToJson(
  _StoreProductTypeResponse instance,
) => <String, dynamic>{'product_type': instance.productType};
