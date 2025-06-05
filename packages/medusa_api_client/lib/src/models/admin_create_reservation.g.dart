// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_create_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCreateReservationImpl _$$AdminCreateReservationImplFromJson(
  Map<String, dynamic> json,
) => _$AdminCreateReservationImpl(
  lineItemId: json['line_item_id'] as String,
  locationId: json['location_id'] as String,
  inventoryItemId: json['inventory_item_id'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  description: json['description'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminCreateReservationImplToJson(
  _$AdminCreateReservationImpl instance,
) => <String, dynamic>{
  'line_item_id': instance.lineItemId,
  'location_id': instance.locationId,
  'inventory_item_id': instance.inventoryItemId,
  'quantity': instance.quantity,
  'description': instance.description,
  'metadata': instance.metadata,
};
