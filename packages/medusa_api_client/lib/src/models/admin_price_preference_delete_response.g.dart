// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_price_preference_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPricePreferenceDeleteResponseImpl
_$$AdminPricePreferenceDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminPricePreferenceDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'price_preference',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminPricePreferenceDeleteResponseImplToJson(
  _$AdminPricePreferenceDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
