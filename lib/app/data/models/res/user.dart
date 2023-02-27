import 'package:medusa_admin/app/data/models/res/common.dart';

import '../store/user.dart';

class UserUpdateUserRes {
  User? user;

  UserUpdateUserRes.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    }
  }
}

class UserRetrieveUserRes {
  User? user;

  UserRetrieveUserRes.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    }
  }
}

class UserResetPasswordRes {
  User? user;

  UserResetPasswordRes.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    }
  }
}

class UserCreateUserRes {
  User? user;

  UserCreateUserRes.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = User.fromJson(json['user']);
    }
  }
}

class UserRetrieveUserListRes extends PaginatedResponse{
  List<User>? userList;

  UserRetrieveUserListRes.fromJson(Map<String, dynamic> json) : super.fromJson(json){
    if (json['users'] != null) {
      userList = [];
      for (Map<String, dynamic> v in (json['users'] as List)) {
        userList?.add(User.fromJson(v));
      }
    }
  }
}

class UserDeleteUserRes {
  /// The ID of the deleted user.
  String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "user"
  String? object;

  /// Whether or not the items were deleted.
  ///
  /// Default: true
  bool? deleted;

  UserDeleteUserRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    deleted = json['deleted'];
  }
}
