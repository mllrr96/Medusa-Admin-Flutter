// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_customer_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCustomerGroupResponse _$AdminCustomerGroupResponseFromJson(
  Map<String, dynamic> json,
) => _AdminCustomerGroupResponse(
  customerGroup: AdminCustomerGroup.fromJson(
    json['customer_group'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AdminCustomerGroupResponseToJson(
  _AdminCustomerGroupResponse instance,
) => <String, dynamic>{'customer_group': instance.customerGroup};
