/// PostTaxRegionsIdQueryParameters
/// {
///     "properties": {
///         "fields": {
///             "type": "string",
///             "description": "Comma-separated fields that should be included in the returned data. If a field is prefixed with `+` it will be added to the default fields, using `-` will remove it from the default fields. Without prefix it will replace the entire default fields.",
///             "title": "fields"
///         }
///     },
///     "type": "object"
/// }
library;

import 'exports.dart';
part 'post_tax_regions_id_query_parameters.freezed.dart';
part 'post_tax_regions_id_query_parameters.g.dart'; // PostTaxRegionsIdQueryParameters

@freezed
abstract class PostTaxRegionsIdQueryParameters
    with _$PostTaxRegionsIdQueryParameters {
  const PostTaxRegionsIdQueryParameters._();

  @jsonSerializable
  const factory PostTaxRegionsIdQueryParameters({
    /// fields
    @JsonKey(name: PostTaxRegionsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostTaxRegionsIdQueryParameters;

  factory PostTaxRegionsIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostTaxRegionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
