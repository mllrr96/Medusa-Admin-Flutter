// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_set_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminFulfillmentSetDeleteResponse _$AdminFulfillmentSetDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminFulfillmentSetDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'fulfillment_set',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminFulfillmentSetDeleteResponseToJson(
  _AdminFulfillmentSetDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
