/// PostProductsIdOptionsQueryParameters
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
part 'post_products_id_options_query_parameters.freezed.dart';
part 'post_products_id_options_query_parameters.g.dart'; // PostProductsIdOptionsQueryParameters

@freezed
abstract class PostProductsIdOptionsQueryParameters
    with _$PostProductsIdOptionsQueryParameters {
  const PostProductsIdOptionsQueryParameters._();

  @jsonSerializable
  const factory PostProductsIdOptionsQueryParameters({
    /// fields
    @JsonKey(name: PostProductsIdOptionsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductsIdOptionsQueryParameters;

  factory PostProductsIdOptionsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductsIdOptionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
