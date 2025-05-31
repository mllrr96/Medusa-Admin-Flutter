// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_post_exchanges_items_action_req_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPostExchangesItemsActionReqSchema
_$AdminPostExchangesItemsActionReqSchemaFromJson(Map<String, dynamic> json) =>
    _AdminPostExchangesItemsActionReqSchema(
      quantity: (json['quantity'] as num).toDouble(),
      internalNote: json['internal_note'] as String,
    );

Map<String, dynamic> _$AdminPostExchangesItemsActionReqSchemaToJson(
  _AdminPostExchangesItemsActionReqSchema instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'internal_note': instance.internalNote,
};
