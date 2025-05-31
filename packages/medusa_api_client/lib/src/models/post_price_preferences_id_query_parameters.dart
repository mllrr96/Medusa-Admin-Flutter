/// PostPricePreferencesIdQueryParameters
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
part 'post_price_preferences_id_query_parameters.freezed.dart';
part 'post_price_preferences_id_query_parameters.g.dart'; // PostPricePreferencesIdQueryParameters

@freezed
abstract class PostPricePreferencesIdQueryParameters
    with _$PostPricePreferencesIdQueryParameters {
  const PostPricePreferencesIdQueryParameters._();

  @jsonSerializable
  const factory PostPricePreferencesIdQueryParameters({
    /// fields
    @JsonKey(name: PostPricePreferencesIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPricePreferencesIdQueryParameters;

  factory PostPricePreferencesIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPricePreferencesIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
