// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_exchanges_items_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPostExchangesItemsActionReqSchemaImpl
_$$AdminPostExchangesItemsActionReqSchemaImplFromJson(
  Map<String, dynamic> json,
) => _$AdminPostExchangesItemsActionReqSchemaImpl(
  quantity: (json['quantity'] as num).toDouble(),
  internalNote: json['internal_note'] as String,
);

Map<String, dynamic> _$$AdminPostExchangesItemsActionReqSchemaImplToJson(
  _$AdminPostExchangesItemsActionReqSchemaImpl instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'internal_note': instance.internalNote,
};
