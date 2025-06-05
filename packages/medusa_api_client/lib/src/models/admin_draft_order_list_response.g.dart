// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_draft_order_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminDraftOrderListResponseImpl _$$AdminDraftOrderListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminDraftOrderListResponseImpl(
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  draftOrders: (json['draft_orders'] as List<dynamic>)
      .map((e) => AdminDraftOrder.fromJson(e as Map<String, dynamic>))
      .toList(),
  estimateCount: (json['estimate_count'] as num).toDouble(),
);

Map<String, dynamic> _$$AdminDraftOrderListResponseImplToJson(
  _$AdminDraftOrderListResponseImpl instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'count': instance.count,
  'draft_orders': instance.draftOrders,
  'estimate_count': instance.estimateCount,
};
