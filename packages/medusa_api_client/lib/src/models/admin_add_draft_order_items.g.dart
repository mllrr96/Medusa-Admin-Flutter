// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_add_draft_order_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminAddDraftOrderItems _$AdminAddDraftOrderItemsFromJson(
  Map<String, dynamic> json,
) => _AdminAddDraftOrderItems(
  items: (json['items'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$AdminAddDraftOrderItemsToJson(
  _AdminAddDraftOrderItems instance,
) => <String, dynamic>{'items': instance.items};
