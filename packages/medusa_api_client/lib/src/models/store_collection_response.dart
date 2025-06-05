/// StoreCollectionResponse
/// {
///     "properties": {
///         "collection": {
///             "$ref": "#/components/schemas/StoreCollection"
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
part 'store_collection_response.freezed.dart';
part 'store_collection_response.g.dart'; // StoreCollectionResponse

@freezed
abstract class StoreCollectionResponse with _$StoreCollectionResponse {
  const StoreCollectionResponse._();

  @jsonSerializable
  const factory StoreCollectionResponse({
    /// collection
    @JsonKey(name: StoreCollectionResponse.collectionKey)
    required StoreCollection collection,
  }) = _StoreCollectionResponse;

  factory StoreCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreCollectionResponseFromJson(json);

  static const String collectionKey = r'collection';
}
