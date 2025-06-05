// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderClaimImpl _$$OrderClaimImplFromJson(Map<String, dynamic> json) =>
    _$OrderClaimImpl(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      claimItems: (json['claim_items'] as List<dynamic>)
          .map((e) => BaseClaimItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalItems: (json['additional_items'] as List<dynamic>)
          .map((e) => BaseClaimItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      returnAA: json['return'] as Map<String, dynamic>,
      returnId: json['return_id'] as String,
      noNotification: json['no_notification'] as bool,
      refundAmount: (json['refund_amount'] as num).toDouble(),
      displayId: (json['display_id'] as num).toDouble(),
      shippingMethods: (json['shipping_methods'] as List<dynamic>)
          .map((e) => OrderShippingMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => OrderTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      type: $enumDecode(_$NullEnumEnumMap, json['type']),
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      orderVersion: (json['order_version'] as num).toDouble(),
      rawRefundAmount: json['raw_refund_amount'],
      createdBy: json['created_by'] as String,
      deletedAt: DateTime.parse(json['deleted_at'] as String),
      canceledAt: DateTime.parse(json['canceled_at'] as String),
    );

Map<String, dynamic> _$$OrderClaimImplToJson(_$OrderClaimImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'claim_items': instance.claimItems,
      'additional_items': instance.additionalItems,
      'return': instance.returnAA,
      'return_id': instance.returnId,
      'no_notification': instance.noNotification,
      'refund_amount': instance.refundAmount,
      'display_id': instance.displayId,
      'shipping_methods': instance.shippingMethods,
      'transactions': instance.transactions,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'type': instance.type,
      'order': instance.order,
      'order_version': instance.orderVersion,
      'raw_refund_amount': instance.rawRefundAmount,
      'created_by': instance.createdBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
      'canceled_at': instance.canceledAt.toIso8601String(),
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
