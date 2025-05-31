/// GetPriceListsIdQueryParameters
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
part 'get_price_lists_id_query_parameters.freezed.dart';
part 'get_price_lists_id_query_parameters.g.dart'; // GetPriceListsIdQueryParameters

@freezed
abstract class GetPriceListsIdQueryParameters
    with _$GetPriceListsIdQueryParameters {
  const GetPriceListsIdQueryParameters._();

  @jsonSerializable
  const factory GetPriceListsIdQueryParameters({
    /// fields
    @JsonKey(name: GetPriceListsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetPriceListsIdQueryParameters;

  factory GetPriceListsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetPriceListsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
