/// PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters
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
part 'post_products_id_variants_variant_id_inventory_items_inventory_item_id_query_parameters.freezed.dart';
part 'post_products_id_variants_variant_id_inventory_items_inventory_item_id_query_parameters.g.dart'; // PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters

@freezed
abstract class PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters
    with
        _$PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters {
  const PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters._();

  @jsonSerializable
  const factory PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters({
    /// fields
    @JsonKey(
      name:
          PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters
              .fieldsKey,
    )
    required String fields,
  }) =
      _PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters;

  factory PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PostProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParametersFromJson(
        json,
      );

  static const String fieldsKey = r'fields';
}
