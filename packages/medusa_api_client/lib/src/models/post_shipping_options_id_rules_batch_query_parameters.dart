/// PostShippingOptionsIdRulesBatchQueryParameters
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
part 'post_shipping_options_id_rules_batch_query_parameters.freezed.dart';
part 'post_shipping_options_id_rules_batch_query_parameters.g.dart'; // PostShippingOptionsIdRulesBatchQueryParameters

@freezed
abstract class PostShippingOptionsIdRulesBatchQueryParameters
    with _$PostShippingOptionsIdRulesBatchQueryParameters {
  const PostShippingOptionsIdRulesBatchQueryParameters._();

  @jsonSerializable
  const factory PostShippingOptionsIdRulesBatchQueryParameters({
    /// fields
    @JsonKey(name: PostShippingOptionsIdRulesBatchQueryParameters.fieldsKey)
    required String fields,
  }) = _PostShippingOptionsIdRulesBatchQueryParameters;

  factory PostShippingOptionsIdRulesBatchQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostShippingOptionsIdRulesBatchQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
