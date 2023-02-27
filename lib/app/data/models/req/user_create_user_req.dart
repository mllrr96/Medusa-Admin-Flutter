import 'package:medusa_admin/core/utils/enums.dart';

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
