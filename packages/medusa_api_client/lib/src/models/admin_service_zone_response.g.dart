// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_service_zone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminServiceZoneResponse _$AdminServiceZoneResponseFromJson(
  Map<String, dynamic> json,
) => _AdminServiceZoneResponse(
  serviceZone: AdminServiceZone.fromJson(
    json['service_zone'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminServiceZoneResponseToJson(
  _AdminServiceZoneResponse instance,
) => <String, dynamic>{'service_zone': instance.serviceZone};
