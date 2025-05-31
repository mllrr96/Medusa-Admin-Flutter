// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_product_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateProductOption _$AdminCreateProductOptionFromJson(
  Map<String, dynamic> json,
) => _AdminCreateProductOption(
  title: json['title'] as String,
  values: (json['values'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AdminCreateProductOptionToJson(
  _AdminCreateProductOption instance,
) => <String, dynamic>{'title': instance.title, 'values': instance.values};
