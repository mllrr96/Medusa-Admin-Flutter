import '../../../../core/utils/enums.dart';

class UserUpdateUserReq {
  String? firstName;
  String? lastName;

  /// User role assigned to the user.
  ///
  /// Enum: "admin" "member" "developer"
  UserRole? role;

  /// The api token of the User.
  String? apiToken;

  /// An optional set of key-value pairs with additional information.
  Map<String, dynamic>? metadata;

  UserUpdateUserReq({this.firstName, this.lastName, this.role, this.apiToken, this.metadata});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (firstName != null) {
      data['first_name'] = firstName;
    }

    if (lastName != null) {
      data['last_name'] = lastName;
    }

    if (role != null) {
      data['role'] = role.toString();
    }

    if (apiToken != null) {
      data['api_token'] = apiToken;
    }

    if (metadata != null) {
      data['metadata'] = metadata;
    }
    return data;
  }
}

class UserCreateUserReq {
  /// Email address of the user
  final String email;

  /// Password of the user
  final String password;

  /// The first name of the User.
  final String? firstName;

  /// The last name of the User.
  final String? lastName;

  /// User role assigned to the user.
  ///
  /// Enum: "admin" "member" "developer"
  final UserRole? role;

  const UserCreateUserReq({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.role,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['role'] = role?.value;
    return data;
  }
}
