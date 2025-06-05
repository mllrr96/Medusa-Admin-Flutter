/// AdminTaxRateResponse
/// {
///     "properties": {
///         "tax_rate": {
///             "$ref": "#/components/schemas/AdminTaxRate"
///         }
///     },
///     "type": "object",
///     "required": [
///         "tax_rate"
///     ],
///     "description": "The tax rate's details."
/// }
library;

import 'exports.dart';
part 'admin_tax_rate_response.freezed.dart';
part 'admin_tax_rate_response.g.dart'; // AdminTaxRateResponse

@freezed
abstract class AdminTaxRateResponse with _$AdminTaxRateResponse {
  const AdminTaxRateResponse._();

  @jsonSerializable
  const factory AdminTaxRateResponse({
    /// taxRate
    @JsonKey(name: AdminTaxRateResponse.taxRateKey)
    required AdminTaxRate taxRate,
  }) = _AdminTaxRateResponse;

  factory AdminTaxRateResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminTaxRateResponseFromJson(json);

  static const String taxRateKey = r'tax_rate';
}
