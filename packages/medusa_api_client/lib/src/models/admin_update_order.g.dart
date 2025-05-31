// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdateOrder _$AdminUpdateOrderFromJson(Map<String, dynamic> json) =>
    _AdminUpdateOrder(
      email: json['email'] as String,
      shippingAddress: json['shipping_address'] as Map<String, dynamic>,
      billingAddress: json['billing_address'] as Map<String, dynamic>,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AdminUpdateOrderToJson(_AdminUpdateOrder instance) =>
    <String, dynamic>{
      'email': instance.email,
      'shipping_address': instance.shippingAddress,
      'billing_address': instance.billingAddress,
      'metadata': instance.metadata,
    };
