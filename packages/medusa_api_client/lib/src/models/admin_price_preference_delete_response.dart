/// AdminPricePreferenceDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The price preference's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "price_preference",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the price preference was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the deleted price preference."
/// }
library;

import 'exports.dart';
part 'admin_price_preference_delete_response.freezed.dart';
part 'admin_price_preference_delete_response.g.dart'; // AdminPricePreferenceDeleteResponse

@freezed
abstract class AdminPricePreferenceDeleteResponse
    with _$AdminPricePreferenceDeleteResponse {
  const AdminPricePreferenceDeleteResponse._();

  @jsonSerializable
  const factory AdminPricePreferenceDeleteResponse({
    /// id
    @JsonKey(name: AdminPricePreferenceDeleteResponse.idKey) required String id,

    /// object
    @Default('price_preference')
    @JsonKey(name: AdminPricePreferenceDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminPricePreferenceDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminPricePreferenceDeleteResponse;

  factory AdminPricePreferenceDeleteResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminPricePreferenceDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
