// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_order_edit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminOrderEditResponseImpl _$$AdminOrderEditResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminOrderEditResponseImpl(
  orderChange: AdminOrderChange.fromJson(
    json['order_change'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$AdminOrderEditResponseImplToJson(
  _$AdminOrderEditResponseImpl instance,
) => <String, dynamic>{'order_change': instance.orderChange};
