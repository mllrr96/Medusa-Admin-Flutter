/// PostPaymentCollectionsQueryParameters
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
part 'post_payment_collections_query_parameters.freezed.dart';
part 'post_payment_collections_query_parameters.g.dart'; // PostPaymentCollectionsQueryParameters

@freezed
abstract class PostPaymentCollectionsQueryParameters
    with _$PostPaymentCollectionsQueryParameters {
  const PostPaymentCollectionsQueryParameters._();

  @jsonSerializable
  const factory PostPaymentCollectionsQueryParameters({
    /// fields
    @JsonKey(name: PostPaymentCollectionsQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPaymentCollectionsQueryParameters;

  factory PostPaymentCollectionsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPaymentCollectionsQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
