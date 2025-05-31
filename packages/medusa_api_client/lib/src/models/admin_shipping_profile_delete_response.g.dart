// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_shipping_profile_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminShippingProfileDeleteResponse
_$AdminShippingProfileDeleteResponseFromJson(Map<String, dynamic> json) =>
    _AdminShippingProfileDeleteResponse(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'shipping_profile',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$AdminShippingProfileDeleteResponseToJson(
  _AdminShippingProfileDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
