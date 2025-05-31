// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_transfer_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminTransferOrder _$AdminTransferOrderFromJson(Map<String, dynamic> json) =>
    _AdminTransferOrder(
      customerId: json['customer_id'] as String,
      description: json['description'] as String,
      internalNote: json['internal_note'] as String,
    );

Map<String, dynamic> _$AdminTransferOrderToJson(_AdminTransferOrder instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'description': instance.description,
      'internal_note': instance.internalNote,
    };
