/// GetShippingProfilesIdQueryParameters
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
part 'get_shipping_profiles_id_query_parameters.freezed.dart';
part 'get_shipping_profiles_id_query_parameters.g.dart'; // GetShippingProfilesIdQueryParameters

@freezed
abstract class GetShippingProfilesIdQueryParameters
    with _$GetShippingProfilesIdQueryParameters {
  const GetShippingProfilesIdQueryParameters._();

  @jsonSerializable
  const factory GetShippingProfilesIdQueryParameters({
    /// fields
    @JsonKey(name: GetShippingProfilesIdQueryParameters.fieldsKey)
    required String fields,
  }) = _GetShippingProfilesIdQueryParameters;

  factory GetShippingProfilesIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$GetShippingProfilesIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
