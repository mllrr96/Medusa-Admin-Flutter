import 'package:medusa_admin_flutter/medusa_admin.dart';

class AuthPreference {
  final bool? useBiometric;
  final AuthenticationType authType;

  AuthPreference({this.useBiometric, required this.authType});

  AuthPreference.defaultSettings({
    this.useBiometric,
    this.authType = AuthenticationType.jwt,
  });

  AuthPreference copyWith({
    bool? useBiometric,
    bool resetBiometric = false,
    AuthenticationType? authType,
  }) =>
      AuthPreference(
        useBiometric: resetBiometric ? null : useBiometric ?? this.useBiometric,
        authType: authType ?? this.authType,
      );

  Map<String, dynamic> toJson() => {
        'useBiometric': useBiometric,
        'authType': authType.toString(),
      };

  factory AuthPreference.fromJson(Map<String, dynamic>? json) {
    return AuthPreference(
      useBiometric: json?['useBiometric'],
      authType: AuthenticationType.values.firstWhere(
        (element) => element.toString() == json?['authType'],
        orElse: () => AuthenticationType.jwt,
      ),
    );
  }
}
