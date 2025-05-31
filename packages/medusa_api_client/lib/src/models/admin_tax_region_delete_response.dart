/// AdminTaxRegionDeleteResponse
/// {
///     "properties": {
///         "id": {
///             "type": "string",
///             "description": "The tax region's ID.",
///             "title": "id"
///         },
///         "object": {
///             "type": "string",
///             "description": "The name of the deleted object.",
///             "default": "tax_region",
///             "title": "object"
///         },
///         "deleted": {
///             "type": "boolean",
///             "description": "Whether the tax region was deleted.",
///             "title": "deleted"
///         }
///     },
///     "type": "object",
///     "required": [
///         "id",
///         "object",
///         "deleted"
///     ],
///     "description": "The details of the tax region deletion."
/// }
library;

import 'exports.dart';
part 'admin_tax_region_delete_response.freezed.dart';
part 'admin_tax_region_delete_response.g.dart'; // AdminTaxRegionDeleteResponse

@freezed
abstract class AdminTaxRegionDeleteResponse
    with _$AdminTaxRegionDeleteResponse {
  const AdminTaxRegionDeleteResponse._();

  @jsonSerializable
  const factory AdminTaxRegionDeleteResponse({
    /// id
    @JsonKey(name: AdminTaxRegionDeleteResponse.idKey) required String id,

    /// object
    @Default('tax_region')
    @JsonKey(name: AdminTaxRegionDeleteResponse.objectKey)
    String object,

    /// deleted
    @JsonKey(name: AdminTaxRegionDeleteResponse.deletedKey)
    required bool deleted,
  }) = _AdminTaxRegionDeleteResponse;

  factory AdminTaxRegionDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminTaxRegionDeleteResponseFromJson(json);

  static const String idKey = r'id';

  static const String objectKey = r'object';

  static const String deletedKey = r'deleted';
}
