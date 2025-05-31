// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_option_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductOptionResponse _$AdminProductOptionResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductOptionResponse(
  productOption: AdminProductOption.fromJson(
    json['product_option'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminProductOptionResponseToJson(
  _AdminProductOptionResponse instance,
) => <String, dynamic>{'product_option': instance.productOption};
