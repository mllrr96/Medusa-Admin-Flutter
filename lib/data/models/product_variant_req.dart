import 'package:medusa_admin_dart_client/medusa_admin.dart';

class ProductVariantReq {
  final Product product;
  final ProductVariant? productVariant;

  ProductVariantReq({required this.product, this.productVariant});
}
