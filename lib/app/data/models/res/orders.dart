import '../store/order.dart';
import '../store/reservation.dart';
import 'common.dart';

class UserRetrieveOrderRes {
  Order? order;

  UserRetrieveOrderRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserUpdateOrderRes {
  Order? order;

  UserUpdateOrderRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserArchiveOrderRes {
  Order? order;

  UserArchiveOrderRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserCancelOrderRes {
  Order? order;

  UserCancelOrderRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserCaptureOrderPaymentRes {
  Order? order;

  UserCaptureOrderPaymentRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserCreateReservationForLineItemOrderRes {
  Reservation? reservation;

  UserCreateReservationForLineItemOrderRes.fromJson(json) {
    reservation = json["reservation"] != null ? Reservation.fromJson(json["reservation"]) : null;
  }
}

class UserCompleteOrderRes {
  Order? order;

  UserCompleteOrderRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserCreateOrderShipmentRes {
  Order? order;

  UserCreateOrderShipmentRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserCreateRefundOrdersRes {
  Order? order;

  UserCreateRefundOrdersRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserRequestReturnOrdersRes {
  Order? order;

  UserRequestReturnOrdersRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserAddShippingMethodOrderRes {
  Order? order;

  UserAddShippingMethodOrderRes.fromJson(json) {
    order = json["order"] != null ? Order.fromJson(json["order"]) : null;
  }
}

class UserRetrieveOrdersRes extends PaginatedResponse {
  List<Order>? orders;

  UserRetrieveOrdersRes.fromJson(json) : super.fromJson(json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders?.add(Order.fromJson(v));
      });
    }
  }
}

class UserRetrieveOrderReservationsRes extends PaginatedResponse {
  List<Reservation>? reservation;

  UserRetrieveOrderReservationsRes.fromJson(json) : super.fromJson(json) {
    if (json['reservation'] != null) {
      reservation = <Reservation>[];
      json['reservation'].forEach((v) {
        reservation?.add(Reservation.fromJson(v));
      });
    }
  }
}
