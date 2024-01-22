import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DraftsUseCase {
  static DraftsUseCase get instance => getIt<DraftsUseCase>();
  DraftOrderRepository get _draftOrderRepository =>
      getIt<MedusaAdmin>().draftOrderRepository;
  Future<Result<UserDraftOrdersRes, Failure>> call({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftOrderRepository.retrieveDraftOrders(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
