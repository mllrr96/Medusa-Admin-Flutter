// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_price_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdatePriceList _$AdminUpdatePriceListFromJson(
  Map<String, dynamic> json,
) => _AdminUpdatePriceList(
  title: json['title'] as String,
  description: json['description'] as String,
  startsAt: json['starts_at'] as String,
  endsAt: json['ends_at'] as String,
  status: $enumDecode(_$NullEnumEnumMap, json['status']),
  type: $enumDecode(_$NullEnumEnumMap, json['type']),
  rules: json['rules'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminUpdatePriceListToJson(
  _AdminUpdatePriceList instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'starts_at': instance.startsAt,
  'ends_at': instance.endsAt,
  'status': instance.status,
  'type': instance.type,
  'rules': instance.rules,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
