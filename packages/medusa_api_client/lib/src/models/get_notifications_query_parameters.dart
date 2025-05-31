/// GetNotificationsQueryParameters
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
///             "description": "Search term to apply on the notification's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a notification ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A notification ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by notification IDs."
///                 }
///             ]
///         },
///         "channel": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a notification channel.",
///                     "title": "channel"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A notification channel.",
///                         "title": "channel"
///                     },
///                     "description": "Filter by notification channels."
///                 }
///             ]
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
part 'get_notifications_query_parameters.freezed.dart';
part 'get_notifications_query_parameters.g.dart'; // GetNotificationsQueryParameters

@freezed
abstract class GetNotificationsQueryParameters
    with _$GetNotificationsQueryParameters {
  const GetNotificationsQueryParameters._();

  @jsonSerializable
  const factory GetNotificationsQueryParameters({
    /// fields
    @JsonKey(name: GetNotificationsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetNotificationsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetNotificationsQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetNotificationsQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetNotificationsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetNotificationsQueryParameters.idKey) required dynamic id,

    /// channel
    @JsonKey(name: GetNotificationsQueryParameters.channelKey)
    required dynamic channel,

    /// and
    @JsonKey(name: GetNotificationsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetNotificationsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetNotificationsQueryParameters;

  factory GetNotificationsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String channelKey = r'channel';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
