// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_delete_payment_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminDeletePaymentCollectionResponseImpl
_$$AdminDeletePaymentCollectionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminDeletePaymentCollectionResponseImpl(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'payment-collection',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$$AdminDeletePaymentCollectionResponseImplToJson(
  _$AdminDeletePaymentCollectionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
