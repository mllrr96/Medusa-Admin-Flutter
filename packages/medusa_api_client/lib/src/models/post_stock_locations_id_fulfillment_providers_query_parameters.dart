/// PostStockLocationsIdFulfillmentProvidersQueryParameters
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
part 'post_stock_locations_id_fulfillment_providers_query_parameters.freezed.dart';
part 'post_stock_locations_id_fulfillment_providers_query_parameters.g.dart'; // PostStockLocationsIdFulfillmentProvidersQueryParameters

@freezed
abstract class PostStockLocationsIdFulfillmentProvidersQueryParameters
    with _$PostStockLocationsIdFulfillmentProvidersQueryParameters {
  const PostStockLocationsIdFulfillmentProvidersQueryParameters._();

  @jsonSerializable
  const factory PostStockLocationsIdFulfillmentProvidersQueryParameters({
    /// fields
    @JsonKey(
      name: PostStockLocationsIdFulfillmentProvidersQueryParameters.fieldsKey,
    )
    required String fields,
  }) = _PostStockLocationsIdFulfillmentProvidersQueryParameters;

  factory PostStockLocationsIdFulfillmentProvidersQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostStockLocationsIdFulfillmentProvidersQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
