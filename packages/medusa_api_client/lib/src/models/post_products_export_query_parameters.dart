/// PostProductsExportQueryParameters
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
part 'post_products_export_query_parameters.freezed.dart';
part 'post_products_export_query_parameters.g.dart'; // PostProductsExportQueryParameters

@freezed
abstract class PostProductsExportQueryParameters
    with _$PostProductsExportQueryParameters {
  const PostProductsExportQueryParameters._();

  @jsonSerializable
  const factory PostProductsExportQueryParameters({
    /// fields
    @JsonKey(name: PostProductsExportQueryParameters.fieldsKey)
    required String fields,
  }) = _PostProductsExportQueryParameters;

  factory PostProductsExportQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductsExportQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
