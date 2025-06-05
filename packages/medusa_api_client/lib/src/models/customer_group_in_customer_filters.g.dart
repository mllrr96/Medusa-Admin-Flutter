// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_group_in_customer_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerGroupInCustomerFiltersImpl
_$$CustomerGroupInCustomerFiltersImplFromJson(Map<String, dynamic> json) =>
    _$CustomerGroupInCustomerFiltersImpl(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'] as Map<String, dynamic>,
      updatedAt: json['updated_at'] as Map<String, dynamic>,
      deletedAt: json['deleted_at'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$CustomerGroupInCustomerFiltersImplToJson(
  _$CustomerGroupInCustomerFiltersImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'deleted_at': instance.deletedAt,
};
