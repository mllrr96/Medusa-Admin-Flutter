import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class PriceListsUseCase {
  final PriceListRepository _priceListRepository =
      getIt<MedusaAdmin>().priceListRepository;

  static PriceListsUseCase get instance => getIt<PriceListsUseCase>();

  Future<Result<UserPriceListsRes, Failure>> call({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _priceListRepository.retrievePriceLists(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
