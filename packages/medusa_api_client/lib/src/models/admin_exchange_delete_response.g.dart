// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_exchange_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminExchangeDeleteResponse _$AdminExchangeDeleteResponseFromJson(
  Map<String, dynamic> json,
) => _AdminExchangeDeleteResponse(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'exchange',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$AdminExchangeDeleteResponseToJson(
  _AdminExchangeDeleteResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
