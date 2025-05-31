/// PostPaymentCollectionsIdMarkAsPaidQueryParameters
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
part 'post_payment_collections_id_mark_as_paid_query_parameters.freezed.dart';
part 'post_payment_collections_id_mark_as_paid_query_parameters.g.dart'; // PostPaymentCollectionsIdMarkAsPaidQueryParameters

@freezed
abstract class PostPaymentCollectionsIdMarkAsPaidQueryParameters
    with _$PostPaymentCollectionsIdMarkAsPaidQueryParameters {
  const PostPaymentCollectionsIdMarkAsPaidQueryParameters._();

  @jsonSerializable
  const factory PostPaymentCollectionsIdMarkAsPaidQueryParameters({
    /// fields
    @JsonKey(name: PostPaymentCollectionsIdMarkAsPaidQueryParameters.fieldsKey)
    required String fields,
  }) = _PostPaymentCollectionsIdMarkAsPaidQueryParameters;

  factory PostPaymentCollectionsIdMarkAsPaidQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostPaymentCollectionsIdMarkAsPaidQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
