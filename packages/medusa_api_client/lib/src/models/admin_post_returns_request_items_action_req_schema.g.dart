// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_request_items_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostReturnsRequestItemsActionReqSchemaImpl
_$$AdminPostReturnsRequestItemsActionReqSchemaImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPostReturnsRequestItemsActionReqSchemaImpl(
  quantity: (json['quantity'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
  reasonId: json['reason_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$AdminPostReturnsRequestItemsActionReqSchemaImplToJson(
  _$AdminPostReturnsRequestItemsActionReqSchemaImpl instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'internal_note': instance.internalNote,
  'reason_id': instance.reasonId,
  'metadata': instance.metadata,
};
