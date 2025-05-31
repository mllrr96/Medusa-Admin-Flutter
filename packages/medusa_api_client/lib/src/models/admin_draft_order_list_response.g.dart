// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_draft_order_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminDraftOrderListResponse _$AdminDraftOrderListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminDraftOrderListResponse(
  limit: (json['limit'] as num).toDouble(),
  offset: (json['offset'] as num).toDouble(),
  count: (json['count'] as num).toDouble(),
  draftOrders: (json['draft_orders'] as List<dynamic>)
      .map((e) => AdminDraftOrder.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$AdminDraftOrderListResponseToJson(
  _AdminDraftOrderListResponse instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'draft_orders': instance.draftOrders,
  'estimate_count': instance.estimateCount,
};
