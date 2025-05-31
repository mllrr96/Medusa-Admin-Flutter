/// PostPromotionsQueryParameters
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
part 'post_promotions_query_parameters.freezed.dart';
part 'post_promotions_query_parameters.g.dart'; // PostPromotionsQueryParameters

@freezed
abstract class PostPromotionsQueryParameters
    with _$PostPromotionsQueryParameters {
  const PostPromotionsQueryParameters._();

  @jsonSerializable
  const factory PostPromotionsQueryParameters({
    /// fields
    @JsonKey(name: PostPromotionsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPromotionsQueryParameters;

  factory PostPromotionsQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostPromotionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
