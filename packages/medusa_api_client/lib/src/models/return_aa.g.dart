// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_aa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReturnAA _$ReturnAAFromJson(Map<String, dynamic> json) => _ReturnAA(
  id: json['id'] as String,
  status: $enumDecode(_$NullEnumEnumMap, json['status']),
  refundAmount: (json['refund_amount'] as num).toDouble(),
  orderId: json['order_id'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderReturnItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  shippingMethods: (json['shipping_methods'] as List<dynamic>)
      .map((e) => OrderShippingMethod.fromJson(e as Map<String, dynamic>))
      .toList(),
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => OrderTransaction.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  canceledAt: DateTime.parse(json['canceled_at'] as String),
  rawRefundAmount: json['raw_refund_amount'],
  order: Order.fromJson(json['order'] as Map<String, dynamic>),
  exchangeId: json['exchange_id'] as String,
  exchange: json['exchange'] as Map<String, dynamic>,
  claimId: json['claim_id'] as String,
  claim: OrderClaim.fromJson(json['claim'] as Map<String, dynamic>),
  displayId: (json['display_id'] as num).toDouble(),
  locationId: json['location_id'] as String,
  noNotification: json['no_notification'] as bool,
  createdBy: json['created_by'] as String,
  deletedAt: DateTime.parse(json['deleted_at'] as String),
  requestedAt: DateTime.parse(json['requested_at'] as String),
  receivedAt: DateTime.parse(json['received_at'] as String),
);

Map<String, dynamic> _$ReturnAAToJson(_ReturnAA instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'refund_amount': instance.refundAmount,
  'order_id': instance.orderId,
  'items': instance.items,
  'shipping_methods': instance.shippingMethods,
  'transactions': instance.transactions,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'canceled_at': instance.canceledAt.toIso8601String(),
  'raw_refund_amount': instance.rawRefundAmount,
  'order': instance.order,
  'exchange_id': instance.exchangeId,
  'exchange': instance.exchange,
  'claim_id': instance.claimId,
  'claim': instance.claim,
  'display_id': instance.displayId,
  'location_id': instance.locationId,
  'no_notification': instance.noNotification,
  'created_by': instance.createdBy,
  'deleted_at': instance.deletedAt.toIso8601String(),
  'requested_at': instance.requestedAt.toIso8601String(),
  'received_at': instance.receivedAt.toIso8601String(),
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
