// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_returns_dismiss_items_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostReturnsDismissItemsActionReqSchema
_$AdminPostReturnsDismissItemsActionReqSchemaFromJson(
  Map<String, dynamic> json,
) => _AdminPostReturnsDismissItemsActionReqSchema(
  quantity: (json['quantity'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
);

Map<String, dynamic> _$AdminPostReturnsDismissItemsActionReqSchemaToJson(
  _AdminPostReturnsDismissItemsActionReqSchema instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'internal_note': instance.internalNote,
};
