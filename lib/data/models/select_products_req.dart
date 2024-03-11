import 'package:medusa_admin_flutter/medusa_admin.dart';

class SelectProductsReq {
  final List<ProductVariant>? selectedProducts;
  final bool multipleSelect;
  SelectProductsReq({this.multipleSelect = true, this.selectedProducts});
}