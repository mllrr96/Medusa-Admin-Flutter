/// AdminStoreResponse
/// {
///     "properties": {
///         "store": {
///             "$ref": "#/components/schemas/AdminStore"
///         }
///     },
///     "type": "object",
///     "required": [
///         "store"
///     ],
///     "description": "The store's details."
/// }
library;

import 'exports.dart';
part 'admin_store_response.freezed.dart';
part 'admin_store_response.g.dart'; // AdminStoreResponse

@freezed
abstract class AdminStoreResponse with _$AdminStoreResponse {
  const AdminStoreResponse._();

  @jsonSerializable
  const factory AdminStoreResponse({
    /// store
    @JsonKey(name: AdminStoreResponse.storeKey) required AdminStore store,
  }) = _AdminStoreResponse;

  factory AdminStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminStoreResponseFromJson(json);

  static const String storeKey = r'store';
}
