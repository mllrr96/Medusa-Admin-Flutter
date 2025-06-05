/// AdminCollectionResponse
/// {
///     "properties": {
///         "collection": {
///             "$ref": "#/components/schemas/AdminCollection"
///         }
///     },
///     "type": "object",
///     "required": [
///         "collection"
///     ],
///     "description": "The collection's details."
/// }
library;

import 'exports.dart';
part 'admin_collection_response.freezed.dart';
part 'admin_collection_response.g.dart'; // AdminCollectionResponse

@freezed
abstract class AdminCollectionResponse with _$AdminCollectionResponse {
  const AdminCollectionResponse._();

  @jsonSerializable
  const factory AdminCollectionResponse({
    /// collection
    @JsonKey(name: AdminCollectionResponse.collectionKey)
    required AdminCollection collection,
  }) = _AdminCollectionResponse;

  factory AdminCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCollectionResponseFromJson(json);

  static const String collectionKey = r'collection';
}
