/// GetApiKeysQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items to skip when retrieving a list.",
///             "title": "offset"
///         },
///         "limit": {
///             "type": "number",
///             "description": "Limit the number of items returned in the list.",
///             "title": "limit"
///         },
///         "order": {
///             "type": "string",
///             "description": "The field to sort the data by. By default, the sort order is ascending. To change the order to descending, prefix the field name with `-`.",
///             "title": "order"
///         },
///         "q": {
///             "type": "string",
///             "description": "The search term.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an API key's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The API key ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by API key IDs."
///                 }
///             ]
///         },
///         "title": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an API key's title.",
///                     "title": "title"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The API key title.",
///                         "title": "title"
///                     },
///                     "description": "Filter by API key titles."
///                 }
///             ]
///         },
///         "token": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an API key's token.",
///                     "title": "token"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The API key token.",
///                         "title": "token"
///                     },
///                     "description": "Filter by API key tokens."
///                 }
///             ]
///         },
///         "type": {
///             "enum": [
///                 "secret",
///                 "publishable"
///             ],
///             "type": "string"
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the API key's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the API key's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by the API key's deletion date."
///         },
///         "revoked_at": {
///             "type": "object",
///             "description": "Filter by the API key's revoke date."
///         },
///         "$and": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an AND condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$and"
///         },
///         "$or": {
///             "type": "array",
///             "items": {
///                 "type": "object"
///             },
///             "description": "Join query parameters with an OR condition. Each object's content is the same type as the expected query parameters.",
///             "title": "$or"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_api_keys_query_parameters.freezed.dart';
part 'get_api_keys_query_parameters.g.dart'; // GetApiKeysQueryParameters

@freezed
abstract class GetApiKeysQueryParameters with _$GetApiKeysQueryParameters {
  const GetApiKeysQueryParameters._();

  @jsonSerializable
  const factory GetApiKeysQueryParameters({
    /// fields
    @JsonKey(name: GetApiKeysQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetApiKeysQueryParameters.offsetKey) required int offset,

    /// limit
    @JsonKey(name: GetApiKeysQueryParameters.limitKey) required int limit,

    /// order
    @JsonKey(name: GetApiKeysQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetApiKeysQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetApiKeysQueryParameters.idKey) required dynamic id,

    /// title
    @JsonKey(name: GetApiKeysQueryParameters.titleKey) required dynamic title,

    /// token
    @JsonKey(name: GetApiKeysQueryParameters.tokenKey) required dynamic token,

    /// type
    @JsonKey(name: GetApiKeysQueryParameters.typeKey) required NullEnum type,

    /// createdAt
    @JsonKey(name: GetApiKeysQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetApiKeysQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetApiKeysQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// revokedAt
    @JsonKey(name: GetApiKeysQueryParameters.revokedAtKey)
    required Map<String, dynamic> revokedAt,

    /// and
    @JsonKey(name: GetApiKeysQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetApiKeysQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetApiKeysQueryParameters;

  factory GetApiKeysQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetApiKeysQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String titleKey = r'title';

  static const String tokenKey = r'token';

  static const String typeKey = r'type';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String revokedAtKey = r'revoked_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
