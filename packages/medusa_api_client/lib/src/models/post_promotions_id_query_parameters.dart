/// PostPromotionsIdQueryParameters
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
part 'post_promotions_id_query_parameters.freezed.dart';
part 'post_promotions_id_query_parameters.g.dart'; // PostPromotionsIdQueryParameters

@freezed
abstract class PostPromotionsIdQueryParameters
    with _$PostPromotionsIdQueryParameters {
  const PostPromotionsIdQueryParameters._();

  @jsonSerializable
  const factory PostPromotionsIdQueryParameters({
    /// fields
    @JsonKey(name: PostPromotionsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPromotionsIdQueryParameters;

  factory PostPromotionsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostPromotionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
