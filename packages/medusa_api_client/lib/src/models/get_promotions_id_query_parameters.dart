/// GetPromotionsIdQueryParameters
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
part 'get_promotions_id_query_parameters.freezed.dart';
part 'get_promotions_id_query_parameters.g.dart'; // GetPromotionsIdQueryParameters

@freezed
abstract class GetPromotionsIdQueryParameters
    with _$GetPromotionsIdQueryParameters {
  const GetPromotionsIdQueryParameters._();

  @jsonSerializable
  const factory GetPromotionsIdQueryParameters({
    /// fields
    @JsonKey(name: GetPromotionsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetPromotionsIdQueryParameters;

  factory GetPromotionsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$GetPromotionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
