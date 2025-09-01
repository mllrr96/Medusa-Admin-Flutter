import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class OrdersFilterUseCase {
  static OrdersFilterUseCase get instance => getIt<OrdersFilterUseCase>();
  RegionsRepository get _regionsRepository =>
      getIt<MedusaAdmin>().regionsRepository;
  SalesChannelRepository get _salesChannelRepository =>
      getIt<MedusaAdmin>().salesChannelRepository;

  Future<Result<(RegionsRes, SalesChannelRetrieveAllRes), MedusaError>>
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
