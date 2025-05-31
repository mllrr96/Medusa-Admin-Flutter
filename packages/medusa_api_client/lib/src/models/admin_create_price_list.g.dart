// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_price_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreatePriceList _$AdminCreatePriceListFromJson(
  Map<String, dynamic> json,
) => _AdminCreatePriceList(
  title: json['title'] as String,
  description: json['description'] as String,
  startsAt: DateTime.parse(json['starts_at'] as String),
  endsAt: DateTime.parse(json['ends_at'] as String),
  status: $enumDecode(_$NullEnumEnumMap, json['status']),
  type: $enumDecode(_$NullEnumEnumMap, json['type']),
  rules: json['rules'] as Map<String, dynamic>,
  prices: (json['prices'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$AdminCreatePriceListToJson(
  _AdminCreatePriceList instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'starts_at': instance.startsAt.toIso8601String(),
  'ends_at': instance.endsAt.toIso8601String(),
  'status': instance.status,
  'type': instance.type,
  'rules': instance.rules,
  'prices': instance.prices,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
