import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PickProductsUseCase {
  static PickProductsUseCase get instance => getIt<PickProductsUseCase>();
  ProductsRepository get _productsRepository => getIt<MedusaAdmin>().productsRepository;
  Future<Result<ProductsListRes, Failure>> call(
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
