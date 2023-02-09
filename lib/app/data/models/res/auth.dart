import '../store/user.dart';

class UserAuthRes {
  User? user;

  UserAuthRes({this.user});

  UserAuthRes.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user"] = user?.toJson();
    return data;
  }
}
