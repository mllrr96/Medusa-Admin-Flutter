// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_order_changes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminOrderChangesResponseImpl _$$AdminOrderChangesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminOrderChangesResponseImpl(
  orderChanges: (json['order_changes'] as List<dynamic>)
      .map((e) => AdminOrderChange.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AdminOrderChangesResponseImplToJson(
  _$AdminOrderChangesResponseImpl instance,
) => <String, dynamic>{'order_changes': instance.orderChanges};
