/// PostPricePreferencesQueryParameters
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
part 'post_price_preferences_query_parameters.freezed.dart';
part 'post_price_preferences_query_parameters.g.dart'; // PostPricePreferencesQueryParameters

@freezed
abstract class PostPricePreferencesQueryParameters
    with _$PostPricePreferencesQueryParameters {
  const PostPricePreferencesQueryParameters._();

  @jsonSerializable
  const factory PostPricePreferencesQueryParameters({
    /// fields
    @JsonKey(name: PostPricePreferencesQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPricePreferencesQueryParameters;

  factory PostPricePreferencesQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPricePreferencesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
