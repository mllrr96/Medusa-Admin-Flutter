import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ProductCrudUseCase{
  ProductsRepository get _productsRepository =>
      getIt<MedusaAdmin>().productsRepository;
  static ProductCrudUseCase get instance => getIt<ProductCrudUseCase>();
  Future<Result<Product, MedusaError>> fetchProduct(String id,{
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.retrieve(id,
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ProductsListRes, MedusaError>> fetchProducts({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<List<ProductVariant>, MedusaError>> fetchVariants({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.retrieveVariants(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<DeleteProductRes, MedusaError>> deleteProduct({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Product, MedusaError>> updateProduct({
    required String id,
    required PostUpdateProductReq payload,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.update(id: id, userPostUpdateProductReq: payload);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<Product, MedusaError>> createProduct({
    required PostProductReq payload,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.add(userPostProductReq: payload);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}