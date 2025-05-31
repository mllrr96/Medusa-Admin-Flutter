// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCurrency _$AdminCurrencyFromJson(Map<String, dynamic> json) =>
    _AdminCurrency(
      code: json['code'] as String,
      symbol: json['symbol'] as String,
      symbolNative: json['symbol_native'] as String,
      name: json['name'] as String,
      decimalDigits: (json['decimal_digits'] as num).toDouble(),
      rounding: (json['rounding'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$AdminCurrencyToJson(_AdminCurrency instance) =>
    <String, dynamic>{
      'code': instance.code,
      'symbol': instance.symbol,
      'symbol_native': instance.symbolNative,
      'name': instance.name,
      'decimal_digits': instance.decimalDigits,
      'rounding': instance.rounding,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
