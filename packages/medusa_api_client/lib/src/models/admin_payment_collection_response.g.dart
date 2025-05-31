// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_payment_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPaymentCollectionResponse _$AdminPaymentCollectionResponseFromJson(
  Map<String, dynamic> json,
) => _AdminPaymentCollectionResponse(
  paymentCollection: AdminPaymentCollection.fromJson(
    json['payment_collection'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminPaymentCollectionResponseToJson(
  _AdminPaymentCollectionResponse instance,
) => <String, dynamic>{'payment_collection': instance.paymentCollection};
