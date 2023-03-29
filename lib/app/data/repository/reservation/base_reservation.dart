import 'package:medusa_admin/app/data/models/store/reservation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_reservation_req.dart';
import '../../models/res/reservation.dart';

abstract class BaseReservation {
  /// Creates a Reservation which can be associated with any resource as required.
  Future<Result<UserReservationRes, Failure>> createReservation({
    required Reservation reservation,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes a Reservation.
  Future<Result<UserDeleteReservationRes, Failure>> deleteReservation({
    /// The ID of the Reservation to delete.
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes a Reservation.
  Future<Result<UserReservationRes, Failure>> retrieveReservation({
    /// The ID of the reservation to retrieve.
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });

  /// Updates a Reservation which can be associated with any resource as required.
  Future<Result<UserReservationRes, Failure>> updateReservation({
    /// The ID of the reservation to retrieve.
    required String id,
    required UserUpdateReservationReq userUpdateReservationReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  });
}
