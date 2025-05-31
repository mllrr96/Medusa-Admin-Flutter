// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_receive_items_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostReturnsReceiveItemsActionReqSchema
_$AdminPostReturnsReceiveItemsActionReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostReturnsReceiveItemsActionReqSchema(
  quantity: (json['quantity'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
);

Map<String, dynamic> _$AdminPostReturnsReceiveItemsActionReqSchemaToJson(
  _AdminPostReturnsReceiveItemsActionReqSchema instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'internal_note': instance.internalNote,
};
