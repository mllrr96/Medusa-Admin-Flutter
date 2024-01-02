import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class UpdateReturnReasonUseCase {
  final ReturnReasonRepository _returnReasonRepository =
      getIt<MedusaAdmin>().returnReasonRepository;

  static UpdateReturnReasonUseCase instance =
      getIt<UpdateReturnReasonUseCase>();

  Future<Result<ReturnReason, Failure>> create(
      UserCreateReturnReasonReq userCreateReturnReasonReq) async {
    try {
      final result = await _returnReasonRepository.create(
          userCreateReturnReasonReq: userCreateReturnReasonReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ReturnReason, Failure>> update({
    required String id,
    required UserUpdateReturnReasonReq userUpdateReturnReasonReq,
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
