// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address_or_update_address_union.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAddressOrUpdateAddressUnionCreateAddress
_$CreateAddressOrUpdateAddressUnionCreateAddressFromJson(
  Map<String, dynamic> json,
) => CreateAddressOrUpdateAddressUnionCreateAddress(
  CreateAddress.fromJson(json['value'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CreateAddressOrUpdateAddressUnionCreateAddressToJson(
  CreateAddressOrUpdateAddressUnionCreateAddress instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

CreateAddressOrUpdateAddressUnionUpdateAddress
_$CreateAddressOrUpdateAddressUnionUpdateAddressFromJson(
  Map<String, dynamic> json,
) => CreateAddressOrUpdateAddressUnionUpdateAddress(
  UpdateAddress.fromJson(json['value'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CreateAddressOrUpdateAddressUnionUpdateAddressToJson(
  CreateAddressOrUpdateAddressUnionUpdateAddress instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};
