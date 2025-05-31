/// PostFulfillmentsIdCancelQueryParameters
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
part 'post_fulfillments_id_cancel_query_parameters.freezed.dart';
part 'post_fulfillments_id_cancel_query_parameters.g.dart'; // PostFulfillmentsIdCancelQueryParameters

@freezed
abstract class PostFulfillmentsIdCancelQueryParameters
    with _$PostFulfillmentsIdCancelQueryParameters {
  const PostFulfillmentsIdCancelQueryParameters._();

  @jsonSerializable
  const factory PostFulfillmentsIdCancelQueryParameters({
    /// fields
    @JsonKey(name: PostFulfillmentsIdCancelQueryParameters.fieldsKey)
    required String fields,
  }) = _PostFulfillmentsIdCancelQueryParameters;

  factory PostFulfillmentsIdCancelQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostFulfillmentsIdCancelQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
