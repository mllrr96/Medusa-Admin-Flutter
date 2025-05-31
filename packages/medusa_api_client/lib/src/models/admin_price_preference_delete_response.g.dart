// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_preference_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPricePreferenceDeleteResponse
_$AdminPricePreferenceDeleteResponseFromJson(Map<String, dynamic> json) =>
    _AdminPricePreferenceDeleteResponse(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'price_preference',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$AdminPricePreferenceDeleteResponseToJson(
  _AdminPricePreferenceDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
