/// AdminTaxRegionResponse
/// {
///     "properties": {
///         "tax_region": {
///             "$ref": "#/components/schemas/AdminTaxRegion"
///         }
///     },
///     "type": "object",
///     "required": [
///         "tax_region"
///     ],
///     "description": "The tax region's details."
/// }
library;

import 'exports.dart';
part 'admin_tax_region_response.freezed.dart';
part 'admin_tax_region_response.g.dart'; // AdminTaxRegionResponse

@freezed
abstract class AdminTaxRegionResponse with _$AdminTaxRegionResponse {
  const AdminTaxRegionResponse._();

  @jsonSerializable
  const factory AdminTaxRegionResponse({
    /// taxRegion
    @JsonKey(name: AdminTaxRegionResponse.taxRegionKey)
    required AdminTaxRegion taxRegion,
  }) = _AdminTaxRegionResponse;

  factory AdminTaxRegionResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminTaxRegionResponseFromJson(json);

  static const String taxRegionKey = r'tax_region';
}
