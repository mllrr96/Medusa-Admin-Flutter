import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class PickProductsRes {
  PickProductsRes(
      {required this.selectedProducts, required this.deSelectedProducts});
  final List<Product> selectedProducts;
  final List<Product> deSelectedProducts;
}
