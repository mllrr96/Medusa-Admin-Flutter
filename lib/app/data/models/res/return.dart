import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class UserCancelReturnOrderRes {
  final Order? order;
  UserCancelReturnOrderRes(this.order);

  factory UserCancelReturnOrderRes.fromJson(json) {
    return UserCancelReturnOrderRes(json["order"] != null ? Order.fromJson(json["order"]) : null);
  }
}

class UserReceiveReturnOrderRes {
  final Return? returnOrder;
  UserReceiveReturnOrderRes(this.returnOrder);

  factory UserReceiveReturnOrderRes.fromJson(json) {
    return UserReceiveReturnOrderRes(json["return"] != null ? Return.fromJson(json["return"]) : null);
  }
}

class UserRetrieveReturnsRes extends PaginatedResponse {
  List<Return>? returns;

  UserRetrieveReturnsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['return'] == null) return;
    returns = <Return>[];
    json['return'].forEach((v) => returns?.add(Return.fromJson(v)));
  }
}
