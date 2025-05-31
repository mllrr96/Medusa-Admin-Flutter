// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_reservation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminReservationResponse _$AdminReservationResponseFromJson(
  Map<String, dynamic> json,
) => _AdminReservationResponse(
  reservation: AdminReservation.fromJson(
    json['reservation'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminReservationResponseToJson(
  _AdminReservationResponse instance,
) => <String, dynamic>{'reservation': instance.reservation};
