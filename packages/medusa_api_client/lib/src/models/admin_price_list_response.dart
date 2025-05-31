/// AdminPriceListResponse
/// {
///     "properties": {
///         "price_list": {
///             "$ref": "#/components/schemas/AdminPriceList"
///         }
///     },
///     "type": "object",
///     "required": [
///         "price_list"
///     ],
///     "description": "The price list's details."
/// }
library admin_price_list_response;

import 'exports.dart';
part 'admin_price_list_response.freezed.dart';
part 'admin_price_list_response.g.dart'; // AdminPriceListResponse

@freezed
abstract class AdminPriceListResponse with _$AdminPriceListResponse {
  const AdminPriceListResponse._();

  @jsonSerializable
  const factory AdminPriceListResponse({
    /// priceList
    @JsonKey(name: AdminPriceListResponse.priceListKey)
    required AdminPriceList priceList,
  }) = _AdminPriceListResponse;

  factory AdminPriceListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminPriceListResponseFromJson(json);

  static const String priceListKey = r'price_list';
}
