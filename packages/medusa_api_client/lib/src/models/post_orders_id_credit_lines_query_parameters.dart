/// PostOrdersIdCreditLinesQueryParameters
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
part 'post_orders_id_credit_lines_query_parameters.freezed.dart';
part 'post_orders_id_credit_lines_query_parameters.g.dart'; // PostOrdersIdCreditLinesQueryParameters

@freezed
abstract class PostOrdersIdCreditLinesQueryParameters
    with _$PostOrdersIdCreditLinesQueryParameters {
  const PostOrdersIdCreditLinesQueryParameters._();

  @jsonSerializable
  const factory PostOrdersIdCreditLinesQueryParameters({
    /// fields
    @JsonKey(name: PostOrdersIdCreditLinesQueryParameters.fieldsKey)
    required String fields,
  }) = _PostOrdersIdCreditLinesQueryParameters;

  factory PostOrdersIdCreditLinesQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostOrdersIdCreditLinesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
