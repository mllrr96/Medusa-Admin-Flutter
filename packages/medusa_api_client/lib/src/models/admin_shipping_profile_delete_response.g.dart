// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_shipping_profile_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminShippingProfileDeleteResponseImpl
_$$AdminShippingProfileDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminShippingProfileDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'shipping_profile',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminShippingProfileDeleteResponseImplToJson(
  _$AdminShippingProfileDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
