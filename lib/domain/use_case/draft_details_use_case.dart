import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class DraftDetailsUseCase {
  final DraftOrderRepository _draftRepository =
      getIt<MedusaAdmin>().draftOrderRepository;
  static DraftDetailsUseCase get instance => getIt<DraftDetailsUseCase>();

  Future<Result<DraftOrder, Failure>> retrieveDraftOrder({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.retrieveDraftOrder(
          id: id, queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<Order, Failure>> registerPayment({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.registerPayment(
          id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserDeleteDraftOrderRes, Failure>> cancelDraft({
    required String id,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftRepository.deleteDraftOrder(
          id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
