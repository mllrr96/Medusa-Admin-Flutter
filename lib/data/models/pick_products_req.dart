import 'package:medusa_admin_flutter/medusa_admin.dart';

class PickProductsReq {
  PickProductsReq({
    this.selectedProducts,
    this.disabledProducts,
    this.includeVariantCount = false,
  });
  final List<Product>? selectedProducts;
  final List<Product>? disabledProducts;
  final bool includeVariantCount;
}