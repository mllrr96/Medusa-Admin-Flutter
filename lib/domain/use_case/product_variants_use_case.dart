import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ProductVariantsUseCase {
  final ProductVariantRepository _productVariantRepository =
      getIt<MedusaAdmin>().productVariantRepository;
  static ProductVariantsUseCase get instance =>
      getIt<ProductVariantsUseCase>();
  Future<Result<UserRetrieveProductVariantsRes, Failure>> call({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productVariantRepository.retrieveProductVariants(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
