/// AdminFulfillmentSetResponse
/// {
///     "properties": {
///         "fulfillment_set": {
///             "$ref": "#/components/schemas/AdminFulfillmentSet"
///         }
///     },
///     "type": "object",
///     "required": [
///         "fulfillment_set"
///     ],
///     "description": "The fulfillment set's details."
/// }
library;

import 'exports.dart';
part 'admin_fulfillment_set_response.freezed.dart';
part 'admin_fulfillment_set_response.g.dart'; // AdminFulfillmentSetResponse

@freezed
abstract class AdminFulfillmentSetResponse with _$AdminFulfillmentSetResponse {
  const AdminFulfillmentSetResponse._();

  @jsonSerializable
  const factory AdminFulfillmentSetResponse({
    /// fulfillmentSet
    @JsonKey(name: AdminFulfillmentSetResponse.fulfillmentSetKey)
    required AdminFulfillmentSet fulfillmentSet,
  }) = _AdminFulfillmentSetResponse;

  factory AdminFulfillmentSetResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminFulfillmentSetResponseFromJson(json);

  static const String fulfillmentSetKey = r'fulfillment_set';
}
