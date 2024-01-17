import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ReturnReasonsUseCase {
  final ReturnReasonRepository _returnReasonRepository =
      getIt<MedusaAdmin>().returnReasonRepository;

  static ReturnReasonsUseCase get instance => getIt<ReturnReasonsUseCase>();

  Future<Result<UserRetrieveAllReturnReasonRes, Failure>> fetchReturnReasons(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _returnReasonRepository.retrieveAll(
          queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserDeleteReturnReasonRes, Failure>> deleteReturnReason(
      String id) async {
    try {
      final result = await _returnReasonRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
