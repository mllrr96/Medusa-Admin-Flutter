import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ProductCrudUseCase{
  ProductsRepository get _productsRepository =>
      getIt<MedusaAdmin>().productsRepository;
  static ProductCrudUseCase get instance => getIt<ProductCrudUseCase>();
  Future<Result<Product, Failure>> fetchProduct(String id,{
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

  Future<Result<UserProductsListRes, Failure>> fetchProducts({
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

  Future<Result<List<ProductVariant>, Failure>> fetchVariants({
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
  Future<Result<UserDeleteProductRes, Failure>> deleteProduct({
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

  Future<Result<Product, Failure>> updateProduct({
    required String id,
    required UserPostUpdateProductReq userPostUpdateProductReq,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.update(id: id, userPostUpdateProductReq: userPostUpdateProductReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<Product, Failure>> createProduct({
    required UserPostProductReq userPostProductReq,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.add(userPostProductReq: userPostProductReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}