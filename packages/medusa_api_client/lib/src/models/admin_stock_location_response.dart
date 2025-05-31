/// AdminStockLocationResponse
/// {
///     "properties": {
///         "stock_location": {
///             "$ref": "#/components/schemas/AdminStockLocation"
///         }
///     },
///     "type": "object",
///     "required": [
///         "stock_location"
///     ],
///     "description": "The stock location's details."
/// }
library;

import 'exports.dart';
part 'admin_stock_location_response.freezed.dart';
part 'admin_stock_location_response.g.dart'; // AdminStockLocationResponse

@freezed
abstract class AdminStockLocationResponse with _$AdminStockLocationResponse {
  const AdminStockLocationResponse._();

  @jsonSerializable
  const factory AdminStockLocationResponse({
    /// stockLocation
    @JsonKey(name: AdminStockLocationResponse.stockLocationKey)
    required AdminStockLocation stockLocation,
  }) = _AdminStockLocationResponse;

  factory AdminStockLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminStockLocationResponseFromJson(json);

  static const String stockLocationKey = r'stock_location';
}
