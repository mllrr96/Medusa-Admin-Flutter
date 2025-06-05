// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_exchange_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminExchangeDeleteResponseImpl _$$AdminExchangeDeleteResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AdminExchangeDeleteResponseImpl(
  id: json['id'] as String,
  object: json['object'] as String? ?? 'exchange',
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$$AdminExchangeDeleteResponseImplToJson(
  _$AdminExchangeDeleteResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'deleted': instance.deleted,
};
