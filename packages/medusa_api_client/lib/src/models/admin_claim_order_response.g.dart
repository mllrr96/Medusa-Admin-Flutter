// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminClaimOrderResponseImpl _$$AdminClaimOrderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminClaimOrderResponseImpl(
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  claim: AdminClaim.fromJson(json['claim'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AdminClaimOrderResponseImplToJson(
  _$AdminClaimOrderResponseImpl instance,
) => <String, dynamic>{'order': instance.order, 'claim': instance.claim};
