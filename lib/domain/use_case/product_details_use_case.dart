import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class ProductDetailsUseCase{
  final ProductsRepository _productsRepository =
      getIt<MedusaAdmin>().productsRepository;
  static ProductDetailsUseCase get instance => getIt<ProductDetailsUseCase>();
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
}