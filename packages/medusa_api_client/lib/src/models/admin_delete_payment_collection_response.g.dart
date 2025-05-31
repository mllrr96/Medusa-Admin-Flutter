// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_delete_payment_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminDeletePaymentCollectionResponse
_$AdminDeletePaymentCollectionResponseFromJson(Map<String, dynamic> json) =>
    _AdminDeletePaymentCollectionResponse(
      id: json['id'] as String,
      object: json['object'] as String? ?? 'payment-collection',
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$AdminDeletePaymentCollectionResponseToJson(
  _AdminDeletePaymentCollectionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
