import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CategoryCrudUseCase {
  ProductCategoriesRepository get _categoryRepository =>
      _medusaAdminV2.categories;
  final MedusaAdminV2 _medusaAdminV2;

  CategoryCrudUseCase(this._medusaAdminV2);

  static CategoryCrudUseCase get instance => getIt<CategoryCrudUseCase>();

  Future<Result<ProductCategoryListRes, MedusaError>> loadAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _categoryRepository.retrieveAll(query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCategory, MedusaError>> load(
    String id, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.retrieve(id, queryParameters);
      return Success(result.productCategory);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCategory, MedusaError>> create(
    CreateProductCategory createProductCategory, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.create(createProductCategory);
      return Success(result.productCategory);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCategory, MedusaError>> update(
    String id,
    UpdateProductCategory userUpdateProductCategoryReq,
  ) async {
    try {
      final result = await _categoryRepository.update(
        id,
        userUpdateProductCategoryReq,
      );
      return Success(result.productCategory);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCategoryDeleteRes, MedusaError>> delete(
      String id) async {
    try {
      final result = await _categoryRepository.delete(
        id,
      );
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<ProductCategory, MedusaError>> addProducts(
    String id,
    List<String> productIds, {
    Map<String, dynamic>? queryParameters,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _categoryRepository.addProducts(
    //     id,
    //     productIds,
    //     queryParameters: queryParameters,
    //   );
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error) {
    //   return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }

  Future<Result<ProductCategory, MedusaError>> removeProducts(
    String id,
    List<String> productIds, {
    Map<String, dynamic>? queryParameters,
  }) async {
    throw UnimplementedError();
    // try {
    //   final result = await _categoryRepository.removeProducts(
    //     id,
    //     productIds,
    //     queryParameters: queryParameters,
    //   );
    //   return Success(result);
    // } on DioException catch (e) {
    //   return Error(MedusaError.fromHttp(
    //     status: e.response?.statusCode,
    //     body: e.response?.data,
    //     cause: e,
    //   ));
    // } catch (error) {
    //   return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    // }
  }
}
