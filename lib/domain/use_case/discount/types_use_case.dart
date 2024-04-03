import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class TypesUseCase {
  ProductTypeRepository get _typeRepo =>
      getIt<MedusaAdmin>().productTypeRepository;
  static TypesUseCase get instance => getIt<TypesUseCase>();

  Future<Result<RetrieveProductTypesRes, Failure>> retrieveProductTypes({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _typeRepo.retrieveProductTypes(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
