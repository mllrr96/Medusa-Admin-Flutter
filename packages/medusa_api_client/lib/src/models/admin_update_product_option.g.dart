// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_product_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdateProductOption _$AdminUpdateProductOptionFromJson(
  Map<String, dynamic> json,
) => _AdminUpdateProductOption(
  title: json['title'] as String,
  values: (json['values'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AdminUpdateProductOptionToJson(
  _AdminUpdateProductOption instance,
) => <String, dynamic>{'title': instance.title, 'values': instance.values};
