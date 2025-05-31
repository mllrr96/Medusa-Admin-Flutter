// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCreateReservation _$AdminCreateReservationFromJson(
  Map<String, dynamic> json,
) => _AdminCreateReservation(
  lineItemId: json['line_item_id'] as String,
  locationId: json['location_id'] as String,
  inventoryItemId: json['inventory_item_id'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  description: json['description'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$AdminCreateReservationToJson(
  _AdminCreateReservation instance,
) => <String, dynamic>{
  'line_item_id': instance.lineItemId,
  'location_id': instance.locationId,
  'inventory_item_id': instance.inventoryItemId,
  'quantity': instance.quantity,
  'description': instance.description,
  'metadata': instance.metadata,
};
