/// AdminExchangeReturnResponse
/// {
///     "properties": {
///         "order_preview": {
///             "$ref": "#/components/schemas/AdminOrderPreview"
///         },
///         "return": {
///             "$ref": "#/components/schemas/AdminReturn"
///         }
///     },
///     "type": "object",
///     "required": [
///         "order_preview",
///         "return"
///     ],
///     "description": "The details of an exchange's return."
/// }
library;

import 'exports.dart';
part 'admin_exchange_return_response.freezed.dart';
part 'admin_exchange_return_response.g.dart'; // AdminExchangeReturnResponse

@freezed
abstract class AdminExchangeReturnResponse with _$AdminExchangeReturnResponse {
  const AdminExchangeReturnResponse._();

  @jsonSerializable
  const factory AdminExchangeReturnResponse({
    /// orderPreview
    @JsonKey(name: AdminExchangeReturnResponse.orderPreviewKey)
    required AdminOrderPreview orderPreview,

    /// returnAA
    @JsonKey(name: AdminExchangeReturnResponse.returnAAKey)
    required AdminReturn returnAA,
  }) = _AdminExchangeReturnResponse;

  factory AdminExchangeReturnResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminExchangeReturnResponseFromJson(json);

  static const String orderPreviewKey = r'order_preview';

  static const String returnAAKey = r'return';
}
