// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderExchangeImpl _$$OrderExchangeImplFromJson(Map<String, dynamic> json) =>
    _$OrderExchangeImpl(
      orderId: json['order_id'] as String,
      additionalItems: (json['additional_items'] as List<dynamic>)
          .map((e) => BaseExchangeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      noNotification: json['no_notification'] as bool,
      differenceDue: (json['difference_due'] as num).toDouble(),
      returnAA: ReturnAA.fromJson(json['return'] as Map<String, dynamic>),
      returnId: json['return_id'] as String,
      id: json['id'] as String,
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
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      orderVersion: (json['order_version'] as num).toDouble(),
      rawDifferenceDue: json['raw_difference_due'],
      allowBackorder: json['allow_backorder'] as bool,
      createdBy: json['created_by'] as String,
      deletedAt: DateTime.parse(json['deleted_at'] as String),
      canceledAt: DateTime.parse(json['canceled_at'] as String),
    );

Map<String, dynamic> _$$OrderExchangeImplToJson(_$OrderExchangeImpl instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'additional_items': instance.additionalItems,
      'no_notification': instance.noNotification,
      'difference_due': instance.differenceDue,
      'return': instance.returnAA,
      'return_id': instance.returnId,
      'id': instance.id,
      'display_id': instance.displayId,
      'shipping_methods': instance.shippingMethods,
      'transactions': instance.transactions,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'order': instance.order,
      'order_version': instance.orderVersion,
      'raw_difference_due': instance.rawDifferenceDue,
      'allow_backorder': instance.allowBackorder,
      'created_by': instance.createdBy,
      'deleted_at': instance.deletedAt.toIso8601String(),
      'canceled_at': instance.canceledAt.toIso8601String(),
    };
