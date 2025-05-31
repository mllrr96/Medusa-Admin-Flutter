// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_customer_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCustomerGroup _$AdminCustomerGroupFromJson(Map<String, dynamic> json) =>
    _AdminCustomerGroup(
      id: json['id'] as String,
      name: json['name'] as String,
      customers: (json['customers'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AdminCustomerGroupToJson(_AdminCustomerGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'customers': instance.customers,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
