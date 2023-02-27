class UserResetPasswordReq {
  /// The Users email.
  final String email;

  /// The Users new password.
  final String password;

  /// The token generated from the 'password-token' endpoint.
  final String token;

  const UserResetPasswordReq({required this.email, required this.password, required this.token});

  Map<String, dynamic> toJson() => {
        'email': email,
        'token': token,
        'password': password,
      };
}
