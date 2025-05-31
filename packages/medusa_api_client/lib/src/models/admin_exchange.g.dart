// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminExchange _$AdminExchangeFromJson(Map<String, dynamic> json) =>
    _AdminExchange(
      orderId: json['order_id'] as String,
      returnItems: (json['return_items'] as List<dynamic>)
          .map((e) => AdminReturnItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalItems: (json['additional_items'] as List<dynamic>)
          .map((e) => BaseExchangeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      noNotification: json['no_notification'] as bool,
      differenceDue: (json['difference_due'] as num).toDouble(),
      returnAA: AdminReturn.fromJson(json['return'] as Map<String, dynamic>),
      returnId: json['return_id'] as String,
      id: json['id'] as String,
      displayId: json['display_id'] as String,
      shippingMethods: (json['shipping_methods'] as List<dynamic>)
          .map(
            (e) => BaseOrderShippingMethod.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => BaseOrderTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      orderVersion: json['order_version'] as String,
      createdBy: json['created_by'] as String,
      canceledAt: DateTime.parse(json['canceled_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
      order: BaseOrder.fromJson(json['order'] as Map<String, dynamic>),
      allowBackorder: json['allow_backorder'] as bool,
    );

Map<String, dynamic> _$AdminExchangeToJson(_AdminExchange instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'return_items': instance.returnItems,
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
      'order_version': instance.orderVersion,
      'created_by': instance.createdBy,
      'canceled_at': instance.canceledAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
      'order': instance.order,
      'allow_backorder': instance.allowBackorder,
    };
