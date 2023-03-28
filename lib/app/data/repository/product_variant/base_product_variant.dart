import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/res/product_variant.dart';

abstract class BaseProductVariant{
  /// Returns the available inventory of a Variant.
  Future<Result<UserRetrieveVariantInventoryRes, Failure>> retrieveVariantInventory({
    /// The Product Variant id to get inventory for.
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a list of Product Variants
  Future<Result<UserRetrieveProductVariantsRes, Failure>> retrieveProductVariants({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });
}