/// PostStockLocationsIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. if a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'post_stock_locations_id_query_parameters.freezed.dart';
part 'post_stock_locations_id_query_parameters.g.dart'; // PostStockLocationsIdQueryParameters

@freezed
abstract class PostStockLocationsIdQueryParameters
    with _$PostStockLocationsIdQueryParameters {
  const PostStockLocationsIdQueryParameters._();

  @jsonSerializable
  const factory PostStockLocationsIdQueryParameters({
    /// fields
    @JsonKey(name: PostStockLocationsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostStockLocationsIdQueryParameters;

  factory PostStockLocationsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostStockLocationsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
