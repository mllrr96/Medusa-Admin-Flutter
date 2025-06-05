// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_transfer_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminTransferOrderImpl _$$AdminTransferOrderImplFromJson(
  Map<String, dynamic> json,
) => _$AdminTransferOrderImpl(
  customerId: json['customer_id'] as String,
  description: json['description'] as String,
  internalNote: json['internal_note'] as String,
);

Map<String, dynamic> _$$AdminTransferOrderImplToJson(
  _$AdminTransferOrderImpl instance,
) => <String, dynamic>{
  'customer_id': instance.customerId,
  'description': instance.description,
  'internal_note': instance.internalNote,
};
