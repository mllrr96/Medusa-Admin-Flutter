import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_product_category.dart';
import '../../models/res/product_category.dart';

abstract class BaseProductCategory {
  /// Assign a batch of products to a product category.
  Future<Result<UserAddProductsToCategoryRes, Failure>> addProductsToCategory({
    /// The ID of the Product Category.
    required String id,

    /// The IDs of the products to add to the Product Category
    required List<String> productIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Retrieves a Product Category.
  Future<Result<UserRetrieveProductCategoryRes, Failure>> retrieveProductCategory({
    /// The ID of the Product Category.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Updates a Product Category.
  Future<Result<UserUpdateProductCategoryRes, Failure>> updateProductCategory({
    /// The ID of the Product Category.
    required String id,
    required UserUpdateProductCategoryReq userUpdateProductCategoryReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Remove a list of products from a product category.
  Future<Result<UserDeleteProductsToCategoryRes, Failure>> deleteProductsFromCategory({
    /// The ID of the Product Category.
    required String id,

    /// The IDs of the products to delete from the Product Category.
    required List<String> productIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Deletes a ProductCategory.
  Future<Result<UserDeleteProductCategoryRes, Failure>> deleteProductCategory({
    /// The ID of the Product Category.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Creates a Product Category.
  Future<Result<UserCreateProductCategoryRes, Failure>> createProductCategory({
    required UserCreateProductCategoryReq userCreateProductCategoryReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Retrieve a list of product categories.
  Future<Result<UserRetrieveProductCategoriesRes, Failure>> retrieveProductCategories({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Retrieve a list of Reservations.
  Future<Result<UserRetrieveReservationsRes, Failure>> retrieveReservations({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
}
