/// GetUsersQueryParameters
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
///             "description": "The search term to filter the user's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a user's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A user's ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by user IDs."
///                 }
///             ]
///         },
///         "email": {
///             "type": "string",
///             "format": "email",
///             "description": "Filter by an email.",
///             "title": "email"
///         },
///         "first_name": {
///             "type": "string",
///             "description": "Filter by a first name.",
///             "title": "first_name"
///         },
///         "last_name": {
///             "type": "string",
///             "description": "Filter by a last name.",
///             "title": "last_name"
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a user's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a user's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a user's deletion date."
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_users_query_parameters.freezed.dart';
part 'get_users_query_parameters.g.dart'; // GetUsersQueryParameters

@freezed
abstract class GetUsersQueryParameters with _$GetUsersQueryParameters {
  const GetUsersQueryParameters._();

  @jsonSerializable
  const factory GetUsersQueryParameters({
    /// fields
    @JsonKey(name: GetUsersQueryParameters.fieldsKey) required String fields,

    /// offset
    @JsonKey(name: GetUsersQueryParameters.offsetKey) required int offset,

    /// limit
    @JsonKey(name: GetUsersQueryParameters.limitKey) required int limit,

    /// order
    @JsonKey(name: GetUsersQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetUsersQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetUsersQueryParameters.idKey) required dynamic id,

    /// email
    @JsonKey(name: GetUsersQueryParameters.emailKey) required String email,

    /// firstName
    @JsonKey(name: GetUsersQueryParameters.firstNameKey)
    required String firstName,

    /// lastName
    @JsonKey(name: GetUsersQueryParameters.lastNameKey)
    required String lastName,

    /// createdAt
    @JsonKey(name: GetUsersQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetUsersQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetUsersQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,
  }) = _GetUsersQueryParameters;

  factory GetUsersQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetUsersQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String emailKey = r'email';

  static const String firstNameKey = r'first_name';

  static const String lastNameKey = r'last_name';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
