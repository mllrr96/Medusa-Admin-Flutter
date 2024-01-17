import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrdersFilterUseCase {
  static OrdersFilterUseCase get instance => getIt<OrdersFilterUseCase>();
  final RegionsRepository _regionsRepository =
      getIt<MedusaAdmin>().regionsRepository;
  final SalesChannelRepository _salesChannelRepository =
      getIt<MedusaAdmin>().salesChannelRepository;

  Future<Result<(UserRegionsRes, UserSalesChannelRetrieveAllRes), Failure>>
      call() async {
    try {
      final regions = await _regionsRepository.retrieveAll();
      final channels = await _salesChannelRepository.retrieveAll();
      return Success((regions!, channels!));
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
