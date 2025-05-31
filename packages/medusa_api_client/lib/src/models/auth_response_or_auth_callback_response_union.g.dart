// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_or_auth_callback_response_union.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseOrAuthCallbackResponseUnionAuthResponse
_$AuthResponseOrAuthCallbackResponseUnionAuthResponseFromJson(
  Map<String, dynamic> json,
) => AuthResponseOrAuthCallbackResponseUnionAuthResponse(
  AuthResponse.fromJson(json['value'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic>
_$AuthResponseOrAuthCallbackResponseUnionAuthResponseToJson(
  AuthResponseOrAuthCallbackResponseUnionAuthResponse instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};

AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponse
_$AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponseFromJson(
  Map<String, dynamic> json,
) => AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponse(
  AuthCallbackResponse.fromJson(json['value'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic>
_$AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponseToJson(
  AuthResponseOrAuthCallbackResponseUnionAuthCallbackResponse instance,
) => <String, dynamic>{'value': instance.value, 'runtimeType': instance.$type};
