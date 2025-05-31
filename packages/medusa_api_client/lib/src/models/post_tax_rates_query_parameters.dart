/// PostTaxRatesQueryParameters
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
part 'post_tax_rates_query_parameters.freezed.dart';
part 'post_tax_rates_query_parameters.g.dart'; // PostTaxRatesQueryParameters

@freezed
abstract class PostTaxRatesQueryParameters with _$PostTaxRatesQueryParameters {
  const PostTaxRatesQueryParameters._();

  @jsonSerializable
  const factory PostTaxRatesQueryParameters({
    /// fields
    @JsonKey(name: PostTaxRatesQueryParameters.fieldsKey)
    required String fields,
  }) = _PostTaxRatesQueryParameters;

  factory PostTaxRatesQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostTaxRatesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
