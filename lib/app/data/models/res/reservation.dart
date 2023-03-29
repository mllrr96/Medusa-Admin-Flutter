import 'package:medusa_admin/app/data/models/store/reservation.dart';

class UserReservationRes {
  final Reservation? reservation;

  UserReservationRes(this.reservation);

  factory UserReservationRes.fromJson(Map<String, dynamic> json) {
    return UserReservationRes(json['reservation'] != null ? Reservation.fromJson(json['reservation']) : null);
  }
}

class UserDeleteReservationRes {
  /// The ID of the deleted Reservation.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "reservation"
  final String? object;

  /// Whether or not the Reservation was deleted.
  final bool deleted;

  UserDeleteReservationRes({required this.deleted, this.id, this.object});

  factory UserDeleteReservationRes.fromJson(json) {
    return UserDeleteReservationRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
