import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CategoryCrudUseCase {
  ProductCategoryRepository get _categoryRepository =>
      getIt<MedusaAdmin>().productCategoryRepository;

  static CategoryCrudUseCase get instance => getIt<CategoryCrudUseCase>();

  Future<Result<UserRetrieveProductCategoriesRes, Failure>> loadAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.retrieveProductCategories(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCategory, Failure>> load(
    String id, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.retrieveProductCategory(
          id: id, queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCategory, Failure>> create(
    UserCreateProductCategoryReq userCreateProductCategoryReq, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.createProductCategory(
          userCreateProductCategoryReq: userCreateProductCategoryReq,
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCategory, Failure>> update(
    String id,
    UserUpdateProductCategoryReq userUpdateProductCategoryReq, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.updateProductCategory(
        id: id,
        userUpdateProductCategoryReq: userUpdateProductCategoryReq,
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserDeleteProductCategoryRes, Failure>> delete(
    String id, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.deleteProductCategory(
        id: id,
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCategory, Failure>> addProductsToCategory(
    String id,
    List<String> productIds, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.addProductsToCategory(
        id: id,
        productIds: productIds,
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductCategory, Failure>> removeProductsToCategory(
    String id,
    List<String> productIds, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.deleteProductsFromCategory(
        id: id,
        productIds: productIds,
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
