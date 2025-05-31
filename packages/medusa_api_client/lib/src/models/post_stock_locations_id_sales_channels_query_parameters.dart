/// PostStockLocationsIdSalesChannelsQueryParameters
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
part 'post_stock_locations_id_sales_channels_query_parameters.freezed.dart';
part 'post_stock_locations_id_sales_channels_query_parameters.g.dart'; // PostStockLocationsIdSalesChannelsQueryParameters

@freezed
abstract class PostStockLocationsIdSalesChannelsQueryParameters
    with _$PostStockLocationsIdSalesChannelsQueryParameters {
  const PostStockLocationsIdSalesChannelsQueryParameters._();

  @jsonSerializable
  const factory PostStockLocationsIdSalesChannelsQueryParameters({
    /// fields
    @JsonKey(name: PostStockLocationsIdSalesChannelsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostStockLocationsIdSalesChannelsQueryParameters;

  factory PostStockLocationsIdSalesChannelsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostStockLocationsIdSalesChannelsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
