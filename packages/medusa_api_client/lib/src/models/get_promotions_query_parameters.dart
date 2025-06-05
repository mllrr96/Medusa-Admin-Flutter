/// GetPromotionsQueryParameters
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
///             "description": "Search term to filter the promotion's searchable attributes.",
///             "title": "q"
///         },
///         "code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a promotion code.",
///                     "title": "code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A promotion code.",
///                         "title": "code"
///                     },
///                     "description": "Filter by promotion codes."
///                 }
///             ]
///         },
///         "campaign_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a campaign's ID to retrieve its associated promotions.",
///                     "title": "campaign_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A campaign's ID.",
///                         "title": "campaign_id"
///                     },
///                     "description": "Filter by campaign IDs to retrieve their associated promotions."
///                 }
///             ]
///         },
///         "application_method": {
///             "type": "object",
///             "description": "Apply filters on the application methods to retrieve the promotions of the matching application methods."
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a promotion's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a promotion's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a promotion's deletion date."
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
///         },
///         "currency_code": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a currency code. The promotions are filtered based on their application method's currency code.",
///                     "title": "currency_code"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A currency code.",
///                         "title": "currency_code"
///                     },
///                     "description": "Filter by currency codes. The promotions are filtered based on their application method's currency code."
///                 }
///             ]
///         },
///         "application_method_type": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by an application method type. The promotions are filtered based on their application method's type.",
///                     "title": "application_method_type"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "An application method type.",
///                         "title": "application_method_type"
///                     },
///                     "description": "Filter by application method types. The promotions are filtered based on their application method's type."
///                 }
///             ]
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_promotions_query_parameters.freezed.dart';
part 'get_promotions_query_parameters.g.dart'; // GetPromotionsQueryParameters

@freezed
abstract class GetPromotionsQueryParameters
    with _$GetPromotionsQueryParameters {
  const GetPromotionsQueryParameters._();

  @jsonSerializable
  const factory GetPromotionsQueryParameters({
    /// fields
    @JsonKey(name: GetPromotionsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetPromotionsQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetPromotionsQueryParameters.limitKey) required int limit,

    /// order
    @JsonKey(name: GetPromotionsQueryParameters.orderKey) required String order,

    /// q
    @JsonKey(name: GetPromotionsQueryParameters.qKey) required String q,

    /// code
    @JsonKey(name: GetPromotionsQueryParameters.codeKey) required dynamic code,

    /// campaignId
    @JsonKey(name: GetPromotionsQueryParameters.campaignIdKey)
    required dynamic campaignId,

    /// applicationMethod
    @JsonKey(name: GetPromotionsQueryParameters.applicationMethodKey)
    required Map<String, dynamic> applicationMethod,

    /// createdAt
    @JsonKey(name: GetPromotionsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetPromotionsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetPromotionsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetPromotionsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetPromotionsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,

    /// currencyCode
    @JsonKey(name: GetPromotionsQueryParameters.currencyCodeKey)
    required dynamic currencyCode,

    /// applicationMethodType
    @JsonKey(name: GetPromotionsQueryParameters.applicationMethodTypeKey)
    required dynamic applicationMethodType,
  }) = _GetPromotionsQueryParameters;

  factory GetPromotionsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetPromotionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String codeKey = r'code';

  static const String campaignIdKey = r'campaign_id';

  static const String applicationMethodKey = r'application_method';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';

  static const String currencyCodeKey = r'currency_code';

  static const String applicationMethodTypeKey = r'application_method_type';
}
