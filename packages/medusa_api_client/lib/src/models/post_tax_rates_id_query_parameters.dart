/// PostTaxRatesIdQueryParameters
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
part 'post_tax_rates_id_query_parameters.freezed.dart';
part 'post_tax_rates_id_query_parameters.g.dart'; // PostTaxRatesIdQueryParameters

@freezed
abstract class PostTaxRatesIdQueryParameters
    with _$PostTaxRatesIdQueryParameters {
  const PostTaxRatesIdQueryParameters._();

  @jsonSerializable
  const factory PostTaxRatesIdQueryParameters({
    /// fields
    @JsonKey(name: PostTaxRatesIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostTaxRatesIdQueryParameters;

  factory PostTaxRatesIdQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostTaxRatesIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
