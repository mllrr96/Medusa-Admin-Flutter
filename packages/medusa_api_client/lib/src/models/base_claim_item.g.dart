// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_claim_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseClaimItem _$BaseClaimItemFromJson(Map<String, dynamic> json) =>
    _BaseClaimItem(
      id: json['id'] as String,
      claimId: json['claim_id'] as String,
      orderId: json['order_id'] as String,
      itemId: json['item_id'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      reason: $enumDecode(_$NullEnumEnumMap, json['reason']),
      rawQuantity: json['raw_quantity'] as Map<String, dynamic>,
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BaseClaimItemToJson(_BaseClaimItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'claim_id': instance.claimId,
      'order_id': instance.orderId,
      'item_id': instance.itemId,
      'quantity': instance.quantity,
      'reason': instance.reason,
      'raw_quantity': instance.rawQuantity,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
