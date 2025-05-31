/// GetOrdersIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         },
///         "id": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The order's ID.",
///                     "title": "id"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The id's ID.",
///                         "title": "id"
///                     },
///                     "description": "The order's ID."
///                 }
///             ]
///         },
///         "status": {
///             "oneOf": [
///                 {
///                     "type": "string",
///                     "description": "The order's status.",
///                     "title": "status"
///                 },
///                 {
///                     "type": "array",
///                     "items": {
///                         "type": "string",
///                         "description": "The status's details.",
///                         "title": "status"
///                     },
///                     "description": "The order's status."
///                 }
///             ]
///         },
///         "version": {
///             "type": "number",
///             "description": "The order's version.",
///             "title": "version"
///         },
///         "created_at": {},
///         "updated_at": {},
///         "deleted_at": {}
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_orders_id_query_parameters.freezed.dart';
part 'get_orders_id_query_parameters.g.dart'; // GetOrdersIdQueryParameters

@freezed
abstract class GetOrdersIdQueryParameters with _$GetOrdersIdQueryParameters {
  const GetOrdersIdQueryParameters._();

  @jsonSerializable
  const factory GetOrdersIdQueryParameters({
    /// fields
    @JsonKey(name: GetOrdersIdQueryParameters.fieldsKey) required String fields,

    /// id
    @JsonKey(name: GetOrdersIdQueryParameters.idKey) required dynamic id,

    /// status
    @JsonKey(name: GetOrdersIdQueryParameters.statusKey)
    required dynamic status,

    /// version
    @JsonKey(name: GetOrdersIdQueryParameters.versionKey)
    required double version,

    /// createdAt
    @JsonKey(name: GetOrdersIdQueryParameters.createdAtKey)
    required dynamic createdAt,

    /// updatedAt
    @JsonKey(name: GetOrdersIdQueryParameters.updatedAtKey)
    required dynamic updatedAt,

    /// deletedAt
    @JsonKey(name: GetOrdersIdQueryParameters.deletedAtKey)
    required dynamic deletedAt,
  }) = _GetOrdersIdQueryParameters;

  factory GetOrdersIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String idKey = r'id';

  static const String statusKey = r'status';

  static const String versionKey = r'version';

  static const String createdAtKey = r'created_at';

  static const String updatedAtKey = r'updated_at';

  static const String deletedAtKey = r'deleted_at';
}
