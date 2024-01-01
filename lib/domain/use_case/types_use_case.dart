import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class TypesUseCase {
  final ProductTypeRepository _typeRepo =
      getIt<MedusaAdmin>().productTypeRepository;
  static TypesUseCase get instance => getIt<TypesUseCase>();

  Future<Result<UserRetrieveProductTypesRes, Failure>> retrieveProductTypes({
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
