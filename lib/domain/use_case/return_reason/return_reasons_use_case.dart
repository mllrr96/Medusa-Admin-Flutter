import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ReturnReasonCrudUseCase {
  ReturnReasonRepository get _returnReasonRepository =>
      getIt<MedusaAdmin>().returnReasonRepository;

  static ReturnReasonCrudUseCase get instance =>
      getIt<ReturnReasonCrudUseCase>();

  Future<Result<ReturnReason, MedusaError>> load(String id,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _returnReasonRepository.retrieve(
          id: id, queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<RetrieveAllReturnReasonRes, MedusaError>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _returnReasonRepository.retrieveAll(
          queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<DeleteReturnReasonRes, MedusaError>> delete(String id) async {
    try {
      final result = await _returnReasonRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

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
