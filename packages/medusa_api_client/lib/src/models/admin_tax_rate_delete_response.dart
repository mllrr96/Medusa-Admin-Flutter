/// AdminTaxRateDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The tax rate's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "tax_rate",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the tax rate was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the tax rate deletion."
/// }
library;

import 'exports.dart';
part 'admin_tax_rate_delete_response.freezed.dart';
part 'admin_tax_rate_delete_response.g.dart'; // AdminTaxRateDeleteResponse

@freezed
abstract class AdminTaxRateDeleteResponse with _$AdminTaxRateDeleteResponse {
  const AdminTaxRateDeleteResponse._();

  @jsonSerializable
  const factory AdminTaxRateDeleteResponse({
    /// id
    @JsonKey(name: AdminTaxRateDeleteResponse.idKey) required String id,

    /// object
    @Default('tax_rate')
    @JsonKey(name: AdminTaxRateDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminTaxRateDeleteResponse.deletedKey) required bool deleted,
  }) = _AdminTaxRateDeleteResponse;

  factory AdminTaxRateDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminTaxRateDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
