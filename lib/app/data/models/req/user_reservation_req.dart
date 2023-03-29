class UserUpdateReservationReq {
  /// The id of the location of the reservation
  final String? locationId;

  final num? quantity;

  /// An optional set of key-value pairs with additional information.
  final Map<String, dynamic>? metadata;
  UserUpdateReservationReq({this.quantity, this.locationId, this.metadata});

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    if (locationId != null) {
      json['location_id'] = locationId;
    }
    if (quantity != null) {
      json['quantity'] = quantity;
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}
