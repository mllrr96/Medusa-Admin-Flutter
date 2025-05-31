/// AdminUserListResponse
/// {
///     "properties": {
///         "limit": {
///             "type": "number",
///             "description": "The maximum number of items returned.",
///             "title": "limit"
///         },
///         "offset": {
///             "type": "number",
///             "description": "The number of items skipped before retrieving the returned items.",
///             "title": "offset"
///         },
///         "count": {
///             "type": "number",
///             "description": "The total number of items.",
///             "title": "count"
///         },
///         "users": {
///             "type": "array",
///             "items": {
///                 "$ref": "#/components/schemas/AdminUser"
///             },
///             "description": "The list of users."
///         },
///         "estimate_count": {
///             "type": "number",
///             "description": "The estimated count retrieved from the PostgreSQL query planner, which may be inaccurate.",
///             "title": "estimate_count"
///         }
///     },
///     "type": "object",
///     "required": [
///         "limit",
///         "offset",
///         "count",
///         "users"
///     ],
///     "description": "The paginated list of users."
/// }
library admin_user_list_response;

import 'exports.dart';
part 'admin_user_list_response.freezed.dart';
part 'admin_user_list_response.g.dart'; // AdminUserListResponse

@freezed
abstract class AdminUserListResponse with _$AdminUserListResponse {
  const AdminUserListResponse._();

  @jsonSerializable
  const factory AdminUserListResponse({
    /// limit
    @JsonKey(name: AdminUserListResponse.limitKey) required double limit,

    /// offset
    @JsonKey(name: AdminUserListResponse.offsetKey) required double offset,

    /// count
    @JsonKey(name: AdminUserListResponse.countKey) required double count,

    /// users
    @JsonKey(name: AdminUserListResponse.usersKey)
    required List<AdminUser> users,

    /// estimateCount
    @JsonKey(name: AdminUserListResponse.estimateCountKey)
    required double estimateCount,
  }) = _AdminUserListResponse;

  factory AdminUserListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminUserListResponseFromJson(json);

  static const String limitKey = r'limit';

  static const String offsetKey = r'offset';

  static const String countKey = r'count';

  static const String usersKey = r'users';

  static const String estimateCountKey = r'estimate_count';
}
