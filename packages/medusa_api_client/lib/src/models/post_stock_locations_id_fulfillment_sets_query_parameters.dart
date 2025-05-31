/// PostStockLocationsIdFulfillmentSetsQueryParameters
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
part 'post_stock_locations_id_fulfillment_sets_query_parameters.freezed.dart';
part 'post_stock_locations_id_fulfillment_sets_query_parameters.g.dart'; // PostStockLocationsIdFulfillmentSetsQueryParameters

@freezed
abstract class PostStockLocationsIdFulfillmentSetsQueryParameters
    with _$PostStockLocationsIdFulfillmentSetsQueryParameters {
  const PostStockLocationsIdFulfillmentSetsQueryParameters._();

  @jsonSerializable
  const factory PostStockLocationsIdFulfillmentSetsQueryParameters({
    /// fields
    @JsonKey(name: PostStockLocationsIdFulfillmentSetsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostStockLocationsIdFulfillmentSetsQueryParameters;

  factory PostStockLocationsIdFulfillmentSetsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostStockLocationsIdFulfillmentSetsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
