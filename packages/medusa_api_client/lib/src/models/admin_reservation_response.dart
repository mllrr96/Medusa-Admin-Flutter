/// AdminReservationResponse
/// {
///     "properties": {
///         "reservation": {
///             "$ref": "#/components/schemas/AdminReservation"
///         }
///     },
///     "type": "object",
///     "required": [
///         "reservation"
///     ],
///     "description": "The reservation's details."
/// }
library;

import 'exports.dart';
part 'admin_reservation_response.freezed.dart';
part 'admin_reservation_response.g.dart'; // AdminReservationResponse

@freezed
abstract class AdminReservationResponse with _$AdminReservationResponse {
  const AdminReservationResponse._();

  @jsonSerializable
  const factory AdminReservationResponse({
    /// reservation
    @JsonKey(name: AdminReservationResponse.reservationKey)
    required AdminReservation reservation,
  }) = _AdminReservationResponse;

  factory AdminReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminReservationResponseFromJson(json);

  static const String reservationKey = r'reservation';
}
