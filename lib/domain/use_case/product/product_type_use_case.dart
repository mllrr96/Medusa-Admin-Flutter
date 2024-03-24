import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ProductTypeUseCase {
  static ProductTypeUseCase get instance => getIt<ProductTypeUseCase>();
  ProductTypeRepository get _typesRepository =>
      getIt<MedusaAdmin>().productTypeRepository;
  Future<Result<UserRetrieveProductTypesRes, Failure>> call(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _typesRepository.retrieveProductTypes(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
