// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductTagResponse _$AdminProductTagResponseFromJson(
  Map<String, dynamic> json,
) => _AdminProductTagResponse(
  productTag: AdminProductTag.fromJson(
    json['product_tag'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminProductTagResponseToJson(
  _AdminProductTagResponse instance,
) => <String, dynamic>{'product_tag': instance.productTag};
