/// DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters
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
part 'delete_products_id_variants_variant_id_inventory_items_inventory_item_id_query_parameters.freezed.dart';
part 'delete_products_id_variants_variant_id_inventory_items_inventory_item_id_query_parameters.g.dart'; // DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters

@freezed
abstract class DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters
    with
        _$DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters {
  const DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters._();

  @jsonSerializable
  const factory DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters({
    /// fields
    @JsonKey(
      name:
          DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters
              .fieldsKey,
    )
    required String fields,
  }) =
      _DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters;

  factory DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParameters.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DeleteProductsIdVariantsVariantIdInventoryItemsInventoryItemIdQueryParametersFromJson(
        json,
      );

  static const String fieldsKey = r'fields';
}
