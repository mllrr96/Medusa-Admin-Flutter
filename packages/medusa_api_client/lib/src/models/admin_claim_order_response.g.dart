// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminClaimOrderResponse _$AdminClaimOrderResponseFromJson(
  Map<String, dynamic> json,
) => _AdminClaimOrderResponse(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  claim: AdminClaim.fromJson(json['claim'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminClaimOrderResponseToJson(
  _AdminClaimOrderResponse instance,
) => <String, dynamic>{'order': instance.order, 'claim': instance.claim};
