// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_order_changes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminOrderChangesResponse _$AdminOrderChangesResponseFromJson(
  Map<String, dynamic> json,
) => _AdminOrderChangesResponse(
  orderChanges: (json['order_changes'] as List<dynamic>)
      .map((e) => AdminOrderChange.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AdminOrderChangesResponseToJson(
  _AdminOrderChangesResponse instance,
) => <String, dynamic>{'order_changes': instance.orderChanges};
