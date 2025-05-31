/// PostShippingOptionsQueryParameters
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
part 'post_shipping_options_query_parameters.freezed.dart';
part 'post_shipping_options_query_parameters.g.dart'; // PostShippingOptionsQueryParameters

@freezed
abstract class PostShippingOptionsQueryParameters
    with _$PostShippingOptionsQueryParameters {
  const PostShippingOptionsQueryParameters._();

  @jsonSerializable
  const factory PostShippingOptionsQueryParameters({
    /// fields
    @JsonKey(name: PostShippingOptionsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostShippingOptionsQueryParameters;

  factory PostShippingOptionsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostShippingOptionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
