// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_fulfillment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminFulfillmentResponse _$AdminFulfillmentResponseFromJson(
  Map<String, dynamic> json,
) => _AdminFulfillmentResponse(
  fulfillment: AdminFulfillment.fromJson(
    json['fulfillment'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminFulfillmentResponseToJson(
  _AdminFulfillmentResponse instance,
) => <String, dynamic>{'fulfillment': instance.fulfillment};
