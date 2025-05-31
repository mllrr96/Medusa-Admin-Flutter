/// PostExchangesIdRequestQueryParameters
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
part 'post_exchanges_id_request_query_parameters.freezed.dart';
part 'post_exchanges_id_request_query_parameters.g.dart'; // PostExchangesIdRequestQueryParameters

@freezed
abstract class PostExchangesIdRequestQueryParameters
    with _$PostExchangesIdRequestQueryParameters {
  const PostExchangesIdRequestQueryParameters._();

  @jsonSerializable
  const factory PostExchangesIdRequestQueryParameters({
    /// fields
    @JsonKey(name: PostExchangesIdRequestQueryParameters.fieldsKey)
    required String fields,
  }) = _PostExchangesIdRequestQueryParameters;

  factory PostExchangesIdRequestQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostExchangesIdRequestQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
