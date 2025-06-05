// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_set_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminFulfillmentSetDeleteResponseImpl
_$$AdminFulfillmentSetDeleteResponseImplFromJson(Map<String, dynamic> json) =>
    _$AdminFulfillmentSetDeleteResponseImpl(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'fulfillment_set',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$AdminFulfillmentSetDeleteResponseImplToJson(
  _$AdminFulfillmentSetDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
