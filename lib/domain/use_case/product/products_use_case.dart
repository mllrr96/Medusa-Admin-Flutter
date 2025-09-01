import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ProductsUseCase {
  ProductsRepository get _productsRepository =>
      getIt<MedusaAdmin>().productsRepository;
  static ProductsUseCase get instance => getIt<ProductsUseCase>();
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

  Future<Result<DeleteProductRes, MedusaError>> delete({
    required String id,
  }) async {
    try {
      final result = await _productsRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Product, MedusaError>> update({
    required String id,
    required PostUpdateProductReq userPostUpdateProductReq,
  }) async {
    try {
      final result = await _productsRepository.update(
          id: id, userPostUpdateProductReq: userPostUpdateProductReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<Product, MedusaError>> add(PostProductReq userPostProductReq
  ) async {
    try {
      final result = await _productsRepository.add(userPostProductReq: userPostProductReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
