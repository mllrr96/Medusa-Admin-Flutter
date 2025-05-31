// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_order_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminOrderChange _$AdminOrderChangeFromJson(
  Map<String, dynamic> json,
) => _AdminOrderChange(
  id: json['id'] as String,
  version: (json['version'] as num).toDouble(),
  changeType: $enumDecode(_$NullEnumEnumMap, json['change_type']),
  orderId: json['order_id'] as String,
  returnId: json['return_id'] as String,
  exchangeId: json['exchange_id'] as String,
  claimId: json['claim_id'] as String,
  order: AdminOrder.fromJson(json['order'] as Map<String, dynamic>),
  returnOrder: AdminReturn.fromJson(
    json['return_order'] as Map<String, dynamic>,
  ),
  exchange: AdminExchange.fromJson(json['exchange'] as Map<String, dynamic>),
  claim: AdminClaim.fromJson(json['claim'] as Map<String, dynamic>),
  actions: (json['actions'] as List<dynamic>)
      .map((e) => AdminOrderChangeAction.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: $enumDecode(_$NullEnumEnumMap, json['status']),
  requestedBy: json['requested_by'] as String,
  requestedAt: DateTime.parse(json['requested_at'] as String),
  confirmedBy: json['confirmed_by'] as String,
  confirmedAt: DateTime.parse(json['confirmed_at'] as String),
  declinedBy: json['declined_by'] as String,
  declinedReason: json['declined_reason'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  declinedAt: DateTime.parse(json['declined_at'] as String),
  canceledBy: json['canceled_by'] as String,
  canceledAt: DateTime.parse(json['canceled_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AdminOrderChangeToJson(_AdminOrderChange instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'change_type': instance.changeType,
      'order_id': instance.orderId,
      'return_id': instance.returnId,
      'exchange_id': instance.exchangeId,
      'claim_id': instance.claimId,
      'order': instance.order,
      'return_order': instance.returnOrder,
      'exchange': instance.exchange,
      'claim': instance.claim,
      'actions': instance.actions,
      'status': instance.status,
      'requested_by': instance.requestedBy,
      'requested_at': instance.requestedAt.toIso8601String(),
      'confirmed_by': instance.confirmedBy,
      'confirmed_at': instance.confirmedAt.toIso8601String(),
      'declined_by': instance.declinedBy,
      'declined_reason': instance.declinedReason,
      'metadata': instance.metadata,
      'declined_at': instance.declinedAt.toIso8601String(),
      'canceled_by': instance.canceledBy,
      'canceled_at': instance.canceledAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
