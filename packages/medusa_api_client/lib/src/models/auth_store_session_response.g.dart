// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStoreSessionResponseImpl _$$AuthStoreSessionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AuthStoreSessionResponseImpl(
  user: StoreCustomer.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AuthStoreSessionResponseImplToJson(
  _$AuthStoreSessionResponseImpl instance,
) => <String, dynamic>{'user': instance.user};
