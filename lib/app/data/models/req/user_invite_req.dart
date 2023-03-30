class UserAcceptInvitationReq {
  /// the first name of the User
  final String firstName;

  /// the last name of the User
  final String lastName;

  /// The desired password for the User
  final String password;

  /// The invite token provided by the admin.
  final String token;
  UserAcceptInvitationReq({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['password'] = password;

    return {
      'user': json,
      'token': token,
    };
  }
}
