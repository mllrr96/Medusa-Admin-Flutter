// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_store_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminStoreCurrencyImpl _$$AdminStoreCurrencyImplFromJson(
  Map<String, dynamic> json,
) => _$AdminStoreCurrencyImpl(
  id: json['id'] as String,
  currencyCode: json['currency_code'] as String,
  storeId: json['store_id'] as String,
  isDefault: json['is_default'] as bool,
  currency: AdminCurrency.fromJson(json['currency'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$$AdminStoreCurrencyImplToJson(
  _$AdminStoreCurrencyImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'currency_code': instance.currencyCode,
  'store_id': instance.storeId,
  'is_default': instance.isDefault,
  'currency': instance.currency,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
};
