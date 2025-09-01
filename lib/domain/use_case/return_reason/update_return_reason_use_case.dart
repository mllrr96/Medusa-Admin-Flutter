import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateReturnReasonUseCase {
  ReturnReasonRepository get _returnReasonRepository =>
      getIt<MedusaAdmin>().returnReasonRepository;

  static UpdateReturnReasonUseCase get instance =>
      getIt<UpdateReturnReasonUseCase>();

  Future<Result<ReturnReason, MedusaError>> create(
      CreateReturnReasonReq userCreateReturnReasonReq) async {
    try {
      final result = await _returnReasonRepository.create(
          userCreateReturnReasonReq: userCreateReturnReasonReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ReturnReason, MedusaError>> update({
    required String id,
    required UpdateReturnReasonReq userUpdateReturnReasonReq,
  }) async {
    try {
      final result = await _returnReasonRepository.update(
          id: id, userUpdateReturnReasonReq: userUpdateReturnReasonReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
