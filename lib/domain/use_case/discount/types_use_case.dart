import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class TypesUseCase {
  ProductTypesRepository get _typeRepo => _medusaAdminV2.productTypes;
  final MedusaAdminV2 _medusaAdminV2;

  TypesUseCase(this._medusaAdminV2);
  static TypesUseCase get instance => getIt<TypesUseCase>();

  Future<Result<ProductTypeListResponse, MedusaError>> retrieveProductTypes({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _typeRepo.list(
          query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
