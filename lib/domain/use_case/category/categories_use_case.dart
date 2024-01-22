import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CategoriesUseCase {
  ProductCategoryRepository get _categoryRepository =>
      getIt<MedusaAdmin>().productCategoryRepository;

  static CategoriesUseCase get instance => getIt<CategoriesUseCase>();

  Future<Result<UserRetrieveProductCategoriesRes, Failure>> call({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _categoryRepository.retrieveProductCategories(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
