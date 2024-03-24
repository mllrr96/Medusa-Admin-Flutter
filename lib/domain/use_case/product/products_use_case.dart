import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ProductsUseCase {
  ProductsRepository get _productsRepository =>
      getIt<MedusaAdmin>().productsRepository;
  static ProductsUseCase get instance => getIt<ProductsUseCase>();
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

  Future<Result<UserDeleteProductRes, Failure>> delete({
    required String id,
  }) async {
    try {
      final result = await _productsRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Product, Failure>> update({
    required String id,
    required UserPostUpdateProductReq userPostUpdateProductReq,
  }) async {
    try {
      final result = await _productsRepository.update(
          id: id, userPostUpdateProductReq: userPostUpdateProductReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<Product, Failure>> add(UserPostProductReq userPostProductReq
  ) async {
    try {
      final result = await _productsRepository.add(userPostProductReq: userPostProductReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
