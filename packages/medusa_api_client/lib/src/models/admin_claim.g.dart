// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminClaimImpl _$$AdminClaimImplFromJson(Map<String, dynamic> json) =>
    _$AdminClaimImpl(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      claimItems: (json['claim_items'] as List<dynamic>)
          .map((e) => BaseClaimItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalItems: (json['additional_items'] as List<dynamic>)
          .map((e) => BaseClaimItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
      returnId: json['return_id'] as String,
      noNotification: json['no_notification'] as bool,
      refundAmount: (json['refund_amount'] as num).toDouble(),
      displayId: (json['display_id'] as num).toDouble(),
      shippingMethods: (json['shipping_methods'] as List<dynamic>)
          .map(
            (e) => AdminOrderShippingMethod.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => BaseOrderTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      order: AdminOrder.fromJson(json['order'] as Map<String, dynamic>),
      type: $enumDecode(_$NullEnumEnumMap, json['type']),
      orderVersion: json['order_version'] as String,
      createdBy: json['created_by'] as String,
      canceledAt: DateTime.parse(json['canceled_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$AdminClaimImplToJson(_$AdminClaimImpl instance) =>
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
      'order': instance.order,
      'type': instance.type,
      'order_version': instance.orderVersion,
      'created_by': instance.createdBy,
      'canceled_at': instance.canceledAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
