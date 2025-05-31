// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_preference_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPricePreferenceResponse _$AdminPricePreferenceResponseFromJson(
  Map<String, dynamic> json,
) => _AdminPricePreferenceResponse(
  pricePreference: AdminPricePreference.fromJson(
    json['price_preference'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminPricePreferenceResponseToJson(
  _AdminPricePreferenceResponse instance,
) => <String, dynamic>{'price_preference': instance.pricePreference};
