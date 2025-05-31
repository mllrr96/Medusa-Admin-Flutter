// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_exchanges_request_items_return_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostExchangesRequestItemsReturnActionReqSchema
_$AdminPostExchangesRequestItemsReturnActionReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostExchangesRequestItemsReturnActionReqSchema(
  quantity: (json['quantity'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
  reasonId: json['reason_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic>
_$AdminPostExchangesRequestItemsReturnActionReqSchemaToJson(
  _AdminPostExchangesRequestItemsReturnActionReqSchema instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'internal_note': instance.internalNote,
  'reason_id': instance.reasonId,
  'metadata': instance.metadata,
};
