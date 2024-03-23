import 'package:medusa_admin_flutter/medusa_admin.dart';

class PickProductsRes {
  PickProductsRes(
      {required this.selectedProducts, required this.deSelectedProducts});
  final List<Product> selectedProducts;
  final List<Product> deSelectedProducts;
}
