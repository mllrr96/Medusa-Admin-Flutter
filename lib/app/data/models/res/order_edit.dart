import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class UserAddLineItemRes {
  final OrderEdit? orderEdit;
  UserAddLineItemRes(this.orderEdit);

  factory UserAddLineItemRes.fromJson(Map<String, dynamic> json) {
    if (json['order_edit'] != null) {
      return UserAddLineItemRes(OrderEdit.fromJson(json['order_edit']));
    } else {
      return UserAddLineItemRes(null);
    }
  }
}

class UserDeleteLineItemRes {
  final OrderEdit? orderEdit;
  UserDeleteLineItemRes(this.orderEdit);

  factory UserDeleteLineItemRes.fromJson(Map<String, dynamic> json) {
    if (json['order_edit'] != null) {
      return UserDeleteLineItemRes(OrderEdit.fromJson(json['order_edit']));
    } else {
      return UserDeleteLineItemRes(null);
    }
  }
}

class UserUpsertLineItemChangeRes {
  final OrderEdit? orderEdit;
  UserUpsertLineItemChangeRes(this.orderEdit);

  factory UserUpsertLineItemChangeRes.fromJson(Map<String, dynamic> json) {
    if (json['order_edit'] != null) {
      return UserUpsertLineItemChangeRes(OrderEdit.fromJson(json['order_edit']));
    } else {
      return UserUpsertLineItemChangeRes(null);
    }
  }
}

class UserDeleteLineItemChangeRes {
  /// The ID of the deleted Order Edit Item Change.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "item_change"
  final String? object;

  /// Whether or not the Order Edit Item Change was deleted.
  final bool deleted;
  UserDeleteLineItemChangeRes({required this.deleted, this.id, this.object});
  factory UserDeleteLineItemChangeRes.fromJson(json) {
    return UserDeleteLineItemChangeRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}

class UserDeleteOrderEditRes {
  /// The ID of the deleted Order Edit.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "order_edit"
  final String? object;

  /// Whether or not the Order Edit was deleted.
  final bool deleted;
  UserDeleteOrderEditRes({required this.deleted, this.id, this.object});
  factory UserDeleteOrderEditRes.fromJson(json) {
    return UserDeleteOrderEditRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}

class UserCancelOrderEditRes {
  final OrderEdit? orderEdit;
  UserCancelOrderEditRes(this.orderEdit);

  factory UserCancelOrderEditRes.fromJson(Map<String, dynamic> json) {
    if (json['order_edit'] != null) {
      return UserCancelOrderEditRes(OrderEdit.fromJson(json['order_edit']));
    } else {
      return UserCancelOrderEditRes(null);
    }
  }
}

class UserConfirmOrderEditRes {
  final OrderEdit? orderEdit;
  UserConfirmOrderEditRes(this.orderEdit);

  factory UserConfirmOrderEditRes.fromJson(Map<String, dynamic> json) {
    if (json['order_edit'] != null) {
      return UserConfirmOrderEditRes(OrderEdit.fromJson(json['order_edit']));
    } else {
      return UserConfirmOrderEditRes(null);
    }
  }
}

class UserUpdateOrderEditRes {
  final OrderEdit? orderEdit;
  UserUpdateOrderEditRes(this.orderEdit);

  factory UserUpdateOrderEditRes.fromJson(Map<String, dynamic> json) {
    if (json['order_edit'] != null) {
      return UserUpdateOrderEditRes(OrderEdit.fromJson(json['order_edit']));
    } else {
      return UserUpdateOrderEditRes(null);
    }
  }
}

class UserRetrieveOrderEditRes {
  final OrderEdit? orderEdit;
  UserRetrieveOrderEditRes(this.orderEdit);

  factory UserRetrieveOrderEditRes.fromJson(Map<String, dynamic> json) {
    if (json['order_edit'] != null) {
      return UserRetrieveOrderEditRes(OrderEdit.fromJson(json['order_edit']));
    } else {
      return UserRetrieveOrderEditRes(null);
    }
  }
}

class UserCreateOrderEditRes {
  final OrderEdit? orderEdit;
  UserCreateOrderEditRes(this.orderEdit);

  factory UserCreateOrderEditRes.fromJson(Map<String, dynamic> json) {
    if (json['order_edit'] != null) {
      return UserCreateOrderEditRes(OrderEdit.fromJson(json['order_edit']));
    } else {
      return UserCreateOrderEditRes(null);
    }
  }
}

class UserRetrieveAllOrderEditRes extends PaginatedResponse {
  List<OrderEdit>? orderEdits;

  UserRetrieveAllOrderEditRes.fromJson(json) : super.fromJson(json) {
    if (json['order_edits'] != null) {
      orderEdits = <OrderEdit>[];
      json['order_edits'].forEach((v) {
        orderEdits?.add(OrderEdit.fromJson(v));
      });
    }
  }
}
