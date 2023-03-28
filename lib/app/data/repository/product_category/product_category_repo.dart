import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_product_category.dart';
import 'package:medusa_admin/app/data/models/res/product_category.dart';
import 'package:multiple_result/multiple_result.dart';
import 'base_product_category.dart';

class ProductCategoryRepo extends BaseProductCategory {
  @override
  Future<Result<UserAddProductsToCategoryRes, Failure>> addProductsToCategory({
    required String id,
    required List<String> productIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement addProductsToCategory
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateProductCategoryRes, Failure>> createProductCategory({
    required UserCreateProductCategoryReq userCreateProductCategoryReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement createProductCategory
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDeleteProductCategoryRes, Failure>> deleteProductCategory({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement deleteProductCategory
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDeleteProductsToCategoryRes, Failure>> deleteProductsFromCategory({
    required String id,
    required List<String> productIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement deleteProductsFromCategory
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveProductCategoriesRes, Failure>> retrieveProductCategories({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement retrieveProductCategories
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveProductCategoryRes, Failure>> retrieveProductCategory({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement retrieveProductCategory
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveReservationsRes, Failure>> retrieveReservations({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement retrieveReservations
    throw UnimplementedError();
  }

  @override
  Future<Result<UserUpdateProductCategoryRes, Failure>> updateProductCategory({
    required String id,
    required UserUpdateProductCategoryReq userUpdateProductCategoryReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    // TODO: implement updateProductCategory
    throw UnimplementedError();
  }
}
