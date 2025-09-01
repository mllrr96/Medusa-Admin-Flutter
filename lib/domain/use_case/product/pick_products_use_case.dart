import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PickProductsUseCase {
  static PickProductsUseCase get instance => getIt<PickProductsUseCase>();
  ProductsRepository get _productsRepository => getIt<MedusaAdmin>().productsRepository;
  Future<Result<ProductsListRes, MedusaError>> call(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _productsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
