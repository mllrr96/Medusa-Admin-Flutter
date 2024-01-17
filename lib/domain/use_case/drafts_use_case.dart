import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DraftsUseCase {
  final DraftOrderRepository _draftRepository =
      getIt<MedusaAdmin>().draftOrderRepository;
  static DraftsUseCase get instance => getIt<DraftsUseCase>();

  Future<Result<UserDraftOrdersRes, Failure>> call({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.retrieveDraftOrders(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
