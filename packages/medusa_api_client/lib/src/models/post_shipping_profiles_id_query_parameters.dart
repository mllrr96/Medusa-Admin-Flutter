/// PostShippingProfilesIdQueryParameters
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
part 'post_shipping_profiles_id_query_parameters.freezed.dart';
part 'post_shipping_profiles_id_query_parameters.g.dart'; // PostShippingProfilesIdQueryParameters

@freezed
abstract class PostShippingProfilesIdQueryParameters
    with _$PostShippingProfilesIdQueryParameters {
  const PostShippingProfilesIdQueryParameters._();

  @jsonSerializable
  const factory PostShippingProfilesIdQueryParameters({
    /// fields
    @JsonKey(name: PostShippingProfilesIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostShippingProfilesIdQueryParameters;

  factory PostShippingProfilesIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostShippingProfilesIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
