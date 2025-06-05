// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminReturnImpl _$$AdminReturnImplFromJson(Map<String, dynamic> json) =>
    _$AdminReturnImpl(
      id: json['id'] as String,
      status: $enumDecode(_$NullEnumEnumMap, json['status']),
      refundAmount: (json['refund_amount'] as num).toDouble(),
      orderId: json['order_id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => AdminReturnItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      canceledAt: DateTime.parse(json['canceled_at'] as String),
      exchangeId: json['exchange_id'] as String,
      locationId: json['location_id'] as String,
      claimId: json['claim_id'] as String,
      orderVersion: (json['order_version'] as num).toDouble(),
      displayId: (json['display_id'] as num).toDouble(),
      noNotification: json['no_notification'] as bool,
      receivedAt: json['received_at'] as String,
    );

Map<String, dynamic> _$$AdminReturnImplToJson(_$AdminReturnImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'refund_amount': instance.refundAmount,
      'order_id': instance.orderId,
      'items': instance.items,
      'created_at': instance.createdAt.toIso8601String(),
      'canceled_at': instance.canceledAt.toIso8601String(),
      'exchange_id': instance.exchangeId,
      'location_id': instance.locationId,
      'claim_id': instance.claimId,
      'order_version': instance.orderVersion,
      'display_id': instance.displayId,
      'no_notification': instance.noNotification,
      'received_at': instance.receivedAt,
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
