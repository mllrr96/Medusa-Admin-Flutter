import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class TagsUseCase {
  ProductTagsRepository get _tagRepo => _medusaAdminV2.productTags;
  final MedusaAdminV2 _medusaAdminV2;

  TagsUseCase(this._medusaAdminV2);
  static TagsUseCase get instance => getIt<TagsUseCase>();

  Future<Result<ProductTagListResponse, MedusaError>> call({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _tagRepo.list(query: queryParameters);
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
