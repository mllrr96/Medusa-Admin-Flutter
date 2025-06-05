// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_product_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminUpdateProductOptionImpl _$$AdminUpdateProductOptionImplFromJson(
  Map<String, dynamic> json,
) => _$AdminUpdateProductOptionImpl(
  title: json['title'] as String,
  values: (json['values'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$$AdminUpdateProductOptionImplToJson(
  _$AdminUpdateProductOptionImpl instance,
) => <String, dynamic>{'title': instance.title, 'values': instance.values};
