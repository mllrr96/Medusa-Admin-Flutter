import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class UserDraftOrderRes {
  final DraftOrder? draftOrder;

  UserDraftOrderRes(this.draftOrder);

  factory UserDraftOrderRes.fromJson(Map<String, dynamic> json) => UserDraftOrderRes(json['draft_order']);
}

class UserRegisterPaymentRes {
  final Order? order;

  UserRegisterPaymentRes(this.order);

  factory UserRegisterPaymentRes.fromJson(Map<String, dynamic> json) =>
      UserRegisterPaymentRes(json['order'] != null ? Order.fromJson(json['order']) : null);
}

class UserDraftOrdersRes extends PaginatedResponse {
  List<DraftOrder>? draftOrders;

  UserDraftOrdersRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['draft_orders'] == null) return;
    draftOrders = <DraftOrder>[];
    json['draft_orders'].forEach((v) => draftOrders!.add(DraftOrder.fromJson(v)));
  }
}

class UserDeleteDraftOrderRes {
  /// The ID of the deleted Draft Order.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "draft-order"
  final String? object;

  /// Whether the draft order was deleted successfully or not.
  final bool deleted;

  UserDeleteDraftOrderRes({
    required this.deleted,
    this.id,
    this.object,
  });

  factory UserDeleteDraftOrderRes.fromJson(json) {
    return UserDeleteDraftOrderRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
