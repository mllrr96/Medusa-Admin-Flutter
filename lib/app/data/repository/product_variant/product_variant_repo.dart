import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/product_variant.dart';
import 'package:multiple_result/multiple_result.dart';
import 'base_product_variant.dart';

class ProductVariantRepo extends BaseProductVariant {
  @override
  Future<Result<UserRetrieveProductVariantsRes, Failure>> retrieveProductVariants(
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieveProductVariants
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveVariantInventoryRes, Failure>> retrieveVariantInventory(
      {required String id, Map<String, dynamic>? customHeaders}) {
    // TODO: implement retrieveVariantInventory
    throw UnimplementedError();
  }
}
