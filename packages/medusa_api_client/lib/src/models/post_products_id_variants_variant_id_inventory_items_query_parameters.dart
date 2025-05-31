/// PostProductsIdVariantsVariantIdInventoryItemsQueryParameters
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
part 'post_products_id_variants_variant_id_inventory_items_query_parameters.freezed.dart';
part 'post_products_id_variants_variant_id_inventory_items_query_parameters.g.dart'; // PostProductsIdVariantsVariantIdInventoryItemsQueryParameters

@freezed
abstract class PostProductsIdVariantsVariantIdInventoryItemsQueryParameters
    with _$PostProductsIdVariantsVariantIdInventoryItemsQueryParameters {
  const PostProductsIdVariantsVariantIdInventoryItemsQueryParameters._();

  @jsonSerializable
  const factory PostProductsIdVariantsVariantIdInventoryItemsQueryParameters({
    /// fields
    @JsonKey(
      name: PostProductsIdVariantsVariantIdInventoryItemsQueryParameters
          .fieldsKey,
    )
    required String fields,
  }) = _PostProductsIdVariantsVariantIdInventoryItemsQueryParameters;

  factory PostProductsIdVariantsVariantIdInventoryItemsQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) => _$PostProductsIdVariantsVariantIdInventoryItemsQueryParametersFromJson(
    json,
  );

  static const String fieldsKey = r'fields';
}
