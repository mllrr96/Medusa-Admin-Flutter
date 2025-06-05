// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_or_auth_callback_response_union.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseOrAuthCallbackResponseUnionAuthResponseImpl
_$$AuthResponseOrAuthCallbackResponseUnionAuthResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AuthResponseOrAuthCallbackResponseUnionAuthResponseImpl(
  AuthResponse.fromJson(json['value'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic>
_$$AuthResponseOrAuthCallbackResponseUnionAuthResponseImplToJson(
  _$AuthResponseOrAuthCallbackResponseUnionAuthResponseImpl instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

_$AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponseImpl
_$$AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponseImpl(
  AuthCallbackResponse.fromJson(json['value'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic>
_$$AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponseImplToJson(
  _$AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponseImpl instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};
