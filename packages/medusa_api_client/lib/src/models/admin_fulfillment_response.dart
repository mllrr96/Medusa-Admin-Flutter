/// AdminFulfillmentResponse
/// {
///     "properties": {
///         "fulfillment": {
///             "$ref": "#/components/schemas/AdminFulfillment"
///         }
///     },
///     "type": "object",
///     "required": [
///         "fulfillment"
///     ],
///     "description": "A fulfillment's details."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment_response.freezed.dart';
part 'admin_fulfillment_response.g.dart'; // AdminFulfillmentResponse

@freezed
abstract class AdminFulfillmentResponse with _$AdminFulfillmentResponse {
  const AdminFulfillmentResponse._();

  @jsonSerializable
  const factory AdminFulfillmentResponse({
    /// fulfillment
    @JsonKey(name: AdminFulfillmentResponse.fulfillmentKey)
    required AdminFulfillment fulfillment,
  }) = _AdminFulfillmentResponse;

  factory AdminFulfillmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminFulfillmentResponseFromJson(json);

  static const String fulfillmentKey = r'fulfillment';
}
