/// PostExchangesQueryParameters
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
part 'post_exchanges_query_parameters.freezed.dart';
part 'post_exchanges_query_parameters.g.dart'; // PostExchangesQueryParameters

@freezed
abstract class PostExchangesQueryParameters
    with _$PostExchangesQueryParameters {
  const PostExchangesQueryParameters._();

  @jsonSerializable
  const factory PostExchangesQueryParameters({
    /// fields
    @JsonKey(name: PostExchangesQueryParameters.fieldsKey)
    required String fields,
  }) = _PostExchangesQueryParameters;

  factory PostExchangesQueryParameters.fromJson(Map<String, dynamic> json) =>
      _$PostExchangesQueryParametersFromJson(json);

  static const String fieldsKey = r'fields';
}
