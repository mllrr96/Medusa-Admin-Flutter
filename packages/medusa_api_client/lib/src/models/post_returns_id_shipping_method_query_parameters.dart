/// PostReturnsIdShippingMethodQueryParameters
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
part 'post_returns_id_shipping_method_query_parameters.freezed.dart';
part 'post_returns_id_shipping_method_query_parameters.g.dart'; // PostReturnsIdShippingMethodQueryParameters

@freezed
abstract class PostReturnsIdShippingMethodQueryParameters
    with _$PostReturnsIdShippingMethodQueryParameters {
  const PostReturnsIdShippingMethodQueryParameters._();

  @jsonSerializable
  const factory PostReturnsIdShippingMethodQueryParameters({
    /// fields
    @JsonKey(name: PostReturnsIdShippingMethodQueryParameters.fieldsKey)
    required String fields,
  }) = _PostReturnsIdShippingMethodQueryParameters;

  factory PostReturnsIdShippingMethodQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostReturnsIdShippingMethodQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
