/// AdminCollectionDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The collection's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "collection",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the collection was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the deleted collection."
/// }
library;

import 'exports.dart';
part 'admin_collection_delete_response.freezed.dart';
part 'admin_collection_delete_response.g.dart'; // AdminCollectionDeleteResponse

@freezed
abstract class AdminCollectionDeleteResponse
    with _$AdminCollectionDeleteResponse {
  const AdminCollectionDeleteResponse._();

  @jsonSerializable
  const factory AdminCollectionDeleteResponse({
    /// id
    @JsonKey(name: AdminCollectionDeleteResponse.idKey) required String id,

    /// object
    @Default('collection')
    @JsonKey(name: AdminCollectionDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminCollectionDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminCollectionDeleteResponse;

  factory AdminCollectionDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminCollectionDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
