/// AdminShippingProfileResponse
/// {
///     "properties": {
///         "shipping_profile": {
///             "$ref": "#/components/schemas/AdminShippingProfile"
///         }
///     },
///     "type": "object",
///     "required": [
///         "shipping_profile"
///     ],
///     "description": "The shipping profile's details."
/// }
library;

import 'exports.dart';
part 'admin_shipping_profile_response.freezed.dart';
part 'admin_shipping_profile_response.g.dart'; // AdminShippingProfileResponse

@freezed
abstract class AdminShippingProfileResponse
    with _$AdminShippingProfileResponse {
  const AdminShippingProfileResponse._();

  @jsonSerializable
  const factory AdminShippingProfileResponse({
    /// shippingProfile
    @JsonKey(name: AdminShippingProfileResponse.shippingProfileKey)
    required AdminShippingProfile shippingProfile,
  }) = _AdminShippingProfileResponse;

  factory AdminShippingProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminShippingProfileResponseFromJson(json);

  static const String shippingProfileKey = r'shipping_profile';
}
