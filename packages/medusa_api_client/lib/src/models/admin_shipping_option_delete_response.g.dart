// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_shipping_option_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminShippingOptionDeleteResponseImpl
_$$AdminShippingOptionDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminShippingOptionDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'shipping_option',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminShippingOptionDeleteResponseImplToJson(
  _$AdminShippingOptionDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
