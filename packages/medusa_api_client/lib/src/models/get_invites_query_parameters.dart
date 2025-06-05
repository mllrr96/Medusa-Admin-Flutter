/// GetInvitesQueryParameters
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
///             "description": "Search term to apply on an invite's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an invite's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An invite's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by invite IDs."
///                 }
///             ]
///         },
///         "email": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "format": "email",
///                     "description": "Filter by an invite's email.",
///                     "title": "email"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "format": "email",
///                         "description": "An email.",
///                         "title": "email"
///                     },
///                     "description": "Filter by invite emails."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by the invite's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by the invite's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by the invite's deletion date."
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
part 'get_invites_query_parameters.freezed.dart';
part 'get_invites_query_parameters.g.dart'; // GetInvitesQueryParameters

@freezed
abstract class GetInvitesQueryParameters with _$GetInvitesQueryParameters {
  const GetInvitesQueryParameters._();

  @jsonSerializable
  const factory GetInvitesQueryParameters({
    /// fields
    @JsonKey(name: GetInvitesQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetInvitesQueryParameters.offsetKey) required int offset,

    /// limit
    @JsonKey(name: GetInvitesQueryParameters.limitKey) required int limit,

    /// order
    @JsonKey(name: GetInvitesQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetInvitesQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetInvitesQueryParameters.idKey) required dynamic id,

    /// email
    @JsonKey(name: GetInvitesQueryParameters.emailKey) required dynamic email,

    /// createdAt
    @JsonKey(name: GetInvitesQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetInvitesQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetInvitesQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetInvitesQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetInvitesQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetInvitesQueryParameters;

  factory GetInvitesQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetInvitesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String emailKey = r'email';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
