import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class SalesChannelsUseCase {
  final SalesChannelRepository _salesChannelRepository =
      getIt<MedusaAdmin>().salesChannelRepository;

  static SalesChannelsUseCase instance = getIt<SalesChannelsUseCase>();

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
