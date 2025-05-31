// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_preference_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPricePreferenceListResponse _$AdminPricePreferenceListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminPricePreferenceListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  pricePreferences: (json['price_preferences'] as List<dynamic>)
      .map((e) => AdminPricePreference.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminPricePreferenceListResponseToJson(
  _AdminPricePreferenceListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'price_preferences': instance.pricePreferences,
  'estimate_count': instance.estimateCount,
};
