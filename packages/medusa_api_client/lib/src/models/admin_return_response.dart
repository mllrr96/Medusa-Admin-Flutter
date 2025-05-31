/// AdminReturnResponse
/// {
///     "properties": {
///         "return": {
///             "$ref": "#/components/schemas/AdminReturn"
///         }
///     },
///     "type": "object",
///     "required": [
///         "return"
///     ],
///     "description": "The return's details."
/// }
library admin_return_response;

import 'exports.dart';
part 'admin_return_response.freezed.dart';
part 'admin_return_response.g.dart'; // AdminReturnResponse

@freezed
abstract class AdminReturnResponse with _$AdminReturnResponse {
  const AdminReturnResponse._();

  @jsonSerializable
  const factory AdminReturnResponse({
    /// returnAA
    @JsonKey(name: AdminReturnResponse.returnAAKey)
    required AdminReturn returnAA,
  }) = _AdminReturnResponse;

  factory AdminReturnResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminReturnResponseFromJson(json);

  static const String returnAAKey = r'return';
}
