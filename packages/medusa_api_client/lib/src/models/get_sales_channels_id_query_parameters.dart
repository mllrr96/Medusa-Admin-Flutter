/// GetSalesChannelsIdQueryParameters
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
part 'get_sales_channels_id_query_parameters.freezed.dart';
part 'get_sales_channels_id_query_parameters.g.dart'; // GetSalesChannelsIdQueryParameters

@freezed
abstract class GetSalesChannelsIdQueryParameters
    with _$GetSalesChannelsIdQueryParameters {
  const GetSalesChannelsIdQueryParameters._();

  @jsonSerializable
  const factory GetSalesChannelsIdQueryParameters({
    /// fields
    @JsonKey(name: GetSalesChannelsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetSalesChannelsIdQueryParameters;

  factory GetSalesChannelsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetSalesChannelsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
