import 'package:medusa_admin_dart_client/medusa_admin.dart';

class PickProductsRes {
  PickProductsRes(
      {required this.selectedProducts, required this.deSelectedProducts});
  final List<Product> selectedProducts;
  final List<Product> deSelectedProducts;
}
