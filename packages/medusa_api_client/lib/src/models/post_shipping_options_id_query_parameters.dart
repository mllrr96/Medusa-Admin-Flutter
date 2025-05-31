/// PostShippingOptionsIdQueryParameters
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
part 'post_shipping_options_id_query_parameters.freezed.dart';
part 'post_shipping_options_id_query_parameters.g.dart'; // PostShippingOptionsIdQueryParameters

@freezed
abstract class PostShippingOptionsIdQueryParameters
    with _$PostShippingOptionsIdQueryParameters {
  const PostShippingOptionsIdQueryParameters._();

  @jsonSerializable
  const factory PostShippingOptionsIdQueryParameters({
    /// fields
    @JsonKey(name: PostShippingOptionsIdQueryParameters.fieldsKey)
    required String fields,
  }) = _PostShippingOptionsIdQueryParameters;

  factory PostShippingOptionsIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostShippingOptionsIdQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
