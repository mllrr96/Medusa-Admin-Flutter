import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class SalesChannelsUseCase {
  final SalesChannelRepository _salesChannelRepository =
      getIt<MedusaAdmin>().salesChannelRepository;

  static SalesChannelsUseCase get instance => getIt<SalesChannelsUseCase>();

  Future<Result<UserSalesChannelRetrieveAllRes, Failure>> call(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _salesChannelRepository.retrieveAll(
          queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
