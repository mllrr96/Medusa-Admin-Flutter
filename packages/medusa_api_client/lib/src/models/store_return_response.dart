/// StoreReturnResponse
/// {
///     "properties": {
///         "return": {
///             "$ref": "#/components/schemas/StoreReturn"
///         }
///     },
///     "type": "object",
///     "required": [
///         "return"
///     ],
///     "description": "The return's details."
/// }
library;

import 'exports.dart';
part 'store_return_response.freezed.dart';
part 'store_return_response.g.dart'; // StoreReturnResponse

@freezed
abstract class StoreReturnResponse with _$StoreReturnResponse {
  const StoreReturnResponse._();

  @jsonSerializable
  const factory StoreReturnResponse({
    /// returnAA
    @JsonKey(name: StoreReturnResponse.returnAAKey)
    required StoreReturn returnAA,
  }) = _StoreReturnResponse;

  factory StoreReturnResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreReturnResponseFromJson(json);

  static const String returnAAKey = r'return';
}
