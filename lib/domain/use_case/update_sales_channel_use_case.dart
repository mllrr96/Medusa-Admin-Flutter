import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateSalesChannelUseCase {
  final SalesChannelRepository _salesChannelRepository =
      getIt<MedusaAdmin>().salesChannelRepository;

  static UpdateSalesChannelUseCase get instance =>
      getIt<UpdateSalesChannelUseCase>();

  Future<Result<SalesChannel, Failure>> create(
      UserSalesChannelCreateReq userSalesChannelCreateReq) async {
    try {
      final result = await _salesChannelRepository.create(
          userSalesChannelCreateReq: userSalesChannelCreateReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<SalesChannel, Failure>> update(
      {required String id,
      required UserSalesChannelUpdateReq userSalesChannelUpdateReq}) async {
    try {
      final result = await _salesChannelRepository.update(
          id: id, userSalesChannelUpdateReq: userSalesChannelUpdateReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
