// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateShipment _$AdminCreateShipmentFromJson(Map<String, dynamic> json) =>
    _AdminCreateShipment(
      labels: (json['labels'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$AdminCreateShipmentToJson(
  _AdminCreateShipment instance,
) => <String, dynamic>{'labels': instance.labels};
