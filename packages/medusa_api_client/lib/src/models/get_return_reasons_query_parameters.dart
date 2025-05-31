/// GetReturnReasonsQueryParameters
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
///             "description": "Search term to filter the return reason's searchable properties.",
///             "title": "q"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a return reason ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A return reason ID.",
///                         "title": "id"
///                     },
///                     "description": "Filter by return reason IDs."
///                 }
///             ]
///         },
///         "value": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a return reason's value.",
///                     "title": "value"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A return reason value.",
///                         "title": "value"
///                     },
///                     "description": "Filter by return reason values."
///                 }
///             ]
///         },
///         "label": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a return reason's label.",
///                     "title": "label"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A return reason label.",
///                         "title": "label"
///                     },
///                     "description": "Filter by return reason labels."
///                 }
///             ]
///         },
///         "description": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a description. This filter looks for an exact match of the return reason's description. To search by a term or keywords, use the  `q` query parameter instead.",
///                     "title": "description"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "A return reason's description.",
///                         "title": "description"
///                     },
///                     "description": "Filter by descriptions. This filter looks for an exact match of the return reason's description. To search by a term or keywords, use the  `q` query parameter instead."
///                 }
///             ]
///         },
///         "parent_return_reason_id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "Filter by a return reason's ID to retrieve its child return reasons.",
///                     "title": "parent_return_reason_id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The return reason's ID.",
///                         "title": "parent_return_reason_id"
///                     },
///                     "description": "Filter by return reason IDs to retrieve their child return reasons."
///                 }
///             ]
///         },
///         "created_at": {
///             "type": "object",
///             "description": "Filter by a return reason's creation date."
///         },
///         "updated_at": {
///             "type": "object",
///             "description": "Filter by a return reason's update date."
///         },
///         "deleted_at": {
///             "type": "object",
///             "description": "Filter by a return reason's deletion date."
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
part 'get_return_reasons_query_parameters.freezed.dart';
part 'get_return_reasons_query_parameters.g.dart'; // GetReturnReasonsQueryParameters

@freezed
abstract class GetReturnReasonsQueryParameters
    with _$GetReturnReasonsQueryParameters {
  const GetReturnReasonsQueryParameters._();

  @jsonSerializable
  const factory GetReturnReasonsQueryParameters({
    /// fields
    @JsonKey(name: GetReturnReasonsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetReturnReasonsQueryParameters.offsetKey)
    required double offset,

    /// limit
    @JsonKey(name: GetReturnReasonsQueryParameters.limitKey)
    required double limit,

    /// order
    @JsonKey(name: GetReturnReasonsQueryParameters.orderKey)
    required String order,

    /// q
    @JsonKey(name: GetReturnReasonsQueryParameters.qKey) required String q,

    /// id
    @JsonKey(name: GetReturnReasonsQueryParameters.idKey) required dynamic id,

    /// value
    @JsonKey(name: GetReturnReasonsQueryParameters.valueKey)
    required dynamic value,

    /// label
    @JsonKey(name: GetReturnReasonsQueryParameters.labelKey)
    required dynamic label,

    /// description
    @JsonKey(name: GetReturnReasonsQueryParameters.descriptionKey)
    required dynamic description,

    /// parentReturnReasonId
    @JsonKey(name: GetReturnReasonsQueryParameters.parentReturnReasonIdKey)
    required dynamic parentReturnReasonId,

    /// createdAt
    @JsonKey(name: GetReturnReasonsQueryParameters.createdAtKey)
    required Map<String, dynamic> createdAt,

    /// updatedAt
    @JsonKey(name: GetReturnReasonsQueryParameters.updatedAtKey)
    required Map<String, dynamic> updatedAt,

    /// deletedAt
    @JsonKey(name: GetReturnReasonsQueryParameters.deletedAtKey)
    required Map<String, dynamic> deletedAt,

    /// and
    @JsonKey(name: GetReturnReasonsQueryParameters.andKey)
    required List<Map<String, dynamic>> and,

    /// or
    @JsonKey(name: GetReturnReasonsQueryParameters.orKey)
    required List<Map<String, dynamic>> or,
  }) = _GetReturnReasonsQueryParameters;

  factory GetReturnReasonsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetReturnReasonsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';

  static const String qKey = r'q';

  static const String idKey = r'id';

  static const String valueKey = r'value';

  static const String labelKey = r'label';

  static const String descriptionKey = r'description';

  static const String parentReturnReasonIdKey = r'parent_return_reason_id';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';

  static const String andKey = r'$and';

  static const String orKey = r'$or';
}
