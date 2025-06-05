/// AdminCreateShipment
/// {
///     "properties": {
///         "labels": {
///             "type": "array",
///             "items": {
///                 "type": "object",
///                 "description": "A shipment label's details."
///             },
///             "description": "The shipment's labels."
///         }
///     },
///     "type": "object",
///     "required": [
///         "labels"
///     ],
///     "description": "The shipment's details."
/// }
library;

import 'exports.dart';
part 'admin_create_shipment.freezed.dart';
part 'admin_create_shipment.g.dart'; // AdminCreateShipment

@freezed
abstract class AdminCreateShipment with _$AdminCreateShipment {
  const AdminCreateShipment._();

  @jsonSerializable
  const factory AdminCreateShipment({
    /// labels
    @JsonKey(name: AdminCreateShipment.labelsKey)
    required List<Map<String, dynamic>> labels,
  }) = _AdminCreateShipment;

  factory AdminCreateShipment.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateShipmentFromJson(json);

  static const String labelsKey = r'labels';
}
