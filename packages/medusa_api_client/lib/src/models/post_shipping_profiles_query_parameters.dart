/// PostShippingProfilesQueryParameters
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
part 'post_shipping_profiles_query_parameters.freezed.dart';
part 'post_shipping_profiles_query_parameters.g.dart'; // PostShippingProfilesQueryParameters

@freezed
abstract class PostShippingProfilesQueryParameters
    with _$PostShippingProfilesQueryParameters {
  const PostShippingProfilesQueryParameters._();

  @jsonSerializable
  const factory PostShippingProfilesQueryParameters({
    /// fields
    @JsonKey(name: PostShippingProfilesQueryParameters.fieldsKey)
    required String fields,
  }) = _PostShippingProfilesQueryParameters;

  factory PostShippingProfilesQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostShippingProfilesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
