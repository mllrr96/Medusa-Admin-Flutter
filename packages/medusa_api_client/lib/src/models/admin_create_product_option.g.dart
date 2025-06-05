// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_product_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreateProductOptionImpl _$$AdminCreateProductOptionImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCreateProductOptionImpl(
  title: json['title'] as String,
  values: (json['values'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$$AdminCreateProductOptionImplToJson(
  _$AdminCreateProductOptionImpl instance,
) => <String, dynamic>{'title': instance.title, 'values': instance.values};
