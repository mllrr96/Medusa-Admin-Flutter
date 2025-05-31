// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_shipping_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminShippingProfileResponse _$AdminShippingProfileResponseFromJson(
  Map<String, dynamic> json,
) => _AdminShippingProfileResponse(
  shippingProfile: AdminShippingProfile.fromJson(
    json['shipping_profile'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminShippingProfileResponseToJson(
  _AdminShippingProfileResponse instance,
) => <String, dynamic>{'shipping_profile': instance.shippingProfile};
