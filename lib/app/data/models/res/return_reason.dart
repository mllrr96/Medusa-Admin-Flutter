import '../store/return_reason.dart';

class UserCreateReturnReasonRes {
  UserCreateReturnReasonRes({required this.returnReason});
  final ReturnReason returnReason;

  factory UserCreateReturnReasonRes.fromJson(Map<String, dynamic> json) =>
      UserCreateReturnReasonRes(returnReason: ReturnReason.fromJson(json['return_reason']));
}

class UserRetrieveReturnReasonRes {
  UserRetrieveReturnReasonRes({required this.returnReason});
  final ReturnReason returnReason;

  factory UserRetrieveReturnReasonRes.fromJson(Map<String, dynamic> json) =>
      UserRetrieveReturnReasonRes(returnReason: ReturnReason.fromJson(json['return_reason']));
}

class UserRetrieveAllReturnReasonRes {
  UserRetrieveAllReturnReasonRes({required this.returnReasons});
  final List<ReturnReason>? returnReasons;

  factory UserRetrieveAllReturnReasonRes.fromJson(Map<String, dynamic> json) {
    var returnReasons = <ReturnReason>[];
    for (var element in (json['return_reasons'] as List)) {
      returnReasons.add(ReturnReason.fromJson(element));
    }
    return UserRetrieveAllReturnReasonRes(returnReasons: returnReasons);
  }
}

class UserUpdateReturnReasonRes {
  UserUpdateReturnReasonRes({required this.returnReason});
  final ReturnReason returnReason;

  factory UserUpdateReturnReasonRes.fromJson(Map<String, dynamic> json) =>
      UserUpdateReturnReasonRes(returnReason: ReturnReason.fromJson(json['return_reason']));
}

class UserDeleteReturnReasonRes {
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

  UserDeleteReturnReasonRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    deleted = json['deleted'];
  }
}
