// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_draft_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdateDraftOrder _$AdminUpdateDraftOrderFromJson(
  Map<String, dynamic> json,
) => _AdminUpdateDraftOrder(
  email: json['email'] as String,
  shippingAddress: json['shipping_address'] as Map<String, dynamic>,
  billingAddress: json['billing_address'] as Map<String, dynamic>,
  metadata: json['metadata'] as Map<String, dynamic>,
  customerId: json['customer_id'] as String,
  salesChannelId: json['sales_channel_id'] as String,
);

Map<String, dynamic> _$AdminUpdateDraftOrderToJson(
  _AdminUpdateDraftOrder instance,
) => <String, dynamic>{
  'email': instance.email,
  'shipping_address': instance.shippingAddress,
  'billing_address': instance.billingAddress,
  'metadata': instance.metadata,
  'customer_id': instance.customerId,
  'sales_channel_id': instance.salesChannelId,
};
