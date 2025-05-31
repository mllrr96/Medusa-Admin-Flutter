/// PostSalesChannelsIdProductsQueryParameters
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
part 'post_sales_channels_id_products_query_parameters.freezed.dart';
part 'post_sales_channels_id_products_query_parameters.g.dart'; // PostSalesChannelsIdProductsQueryParameters

@freezed
abstract class PostSalesChannelsIdProductsQueryParameters
    with _$PostSalesChannelsIdProductsQueryParameters {
  const PostSalesChannelsIdProductsQueryParameters._();

  @jsonSerializable
  const factory PostSalesChannelsIdProductsQueryParameters({
    /// fields
    @JsonKey(name: PostSalesChannelsIdProductsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostSalesChannelsIdProductsQueryParameters;

  factory PostSalesChannelsIdProductsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostSalesChannelsIdProductsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
