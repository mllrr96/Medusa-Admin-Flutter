// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPriceList _$AdminPriceListFromJson(Map<String, dynamic> json) =>
    _AdminPriceList(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      rules: json['rules'] as Map<String, dynamic>,
      startsAt: json['starts_at'] as String,
      endsAt: json['ends_at'] as String,
      status: $enumDecode(_$NullEnumEnumMap, json['status']),
      type: $enumDecode(_$NullEnumEnumMap, json['type']),
      prices: (json['prices'] as List<dynamic>)
          .map((e) => AdminPriceListPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$AdminPriceListToJson(_AdminPriceList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'rules': instance.rules,
      'starts_at': instance.startsAt,
      'ends_at': instance.endsAt,
      'status': instance.status,
      'type': instance.type,
      'prices': instance.prices,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
