/// AdminLinkPriceListProducts
/// {
///     "properties": {
///         "remove": {
///             "type": "array",
///             "items": {
///                 "type": "string",
///                 "description": "The ID of a product.",
///                 "title": "remove"
///             },
///             "description": "The products to remove from the price list."
///         }
///     },
///     "type": "object",
///     "description": "The products removal details."
/// }
library;

import 'exports.dart';
part 'admin_link_price_list_products.freezed.dart';
part 'admin_link_price_list_products.g.dart'; // AdminLinkPriceListProducts

@freezed
abstract class AdminLinkPriceListProducts with _$AdminLinkPriceListProducts {
  const AdminLinkPriceListProducts._();

  @jsonSerializable
  const factory AdminLinkPriceListProducts({
    /// remove
    @JsonKey(name: AdminLinkPriceListProducts.removeKey)
    required List<String> remove,
  }) = _AdminLinkPriceListProducts;

  factory AdminLinkPriceListProducts.fromJson(Map<String, dynamic> json) =>
      _$AdminLinkPriceListProductsFromJson(json);

  static const String removeKey = r'remove';
}
