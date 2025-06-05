/// GetCampaignsQueryParameters
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
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'get_campaigns_query_parameters.freezed.dart';
part 'get_campaigns_query_parameters.g.dart'; // GetCampaignsQueryParameters

@freezed
abstract class GetCampaignsQueryParameters with _$GetCampaignsQueryParameters {
  const GetCampaignsQueryParameters._();

  @jsonSerializable
  const factory GetCampaignsQueryParameters({
    /// fields
    @JsonKey(name: GetCampaignsQueryParameters.fieldsKey)
    required String fields,

    /// offset
    @JsonKey(name: GetCampaignsQueryParameters.offsetKey)
    required int offset,

    /// limit
    @JsonKey(name: GetCampaignsQueryParameters.limitKey) required int limit,

    /// order
    @JsonKey(name: GetCampaignsQueryParameters.orderKey) required String order,
  }) = _GetCampaignsQueryParameters;

  factory GetCampaignsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetCampaignsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';

  static const String offsetKey = r'offset';

  static const String limitKey = r'limit';

  static const String orderKey = r'order';
}
