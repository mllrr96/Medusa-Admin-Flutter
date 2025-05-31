// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_payment_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StorePaymentCollectionResponse _$StorePaymentCollectionResponseFromJson(
  Map<String, dynamic> json,
) => _StorePaymentCollectionResponse(
  paymentCollection: StorePaymentCollection.fromJson(
    json['payment_collection'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$StorePaymentCollectionResponseToJson(
  _StorePaymentCollectionResponse instance,
) => <String, dynamic>{'payment_collection': instance.paymentCollection};
