import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateStoreUseCase {
  StoreRepository get _storeRepository => getIt<MedusaAdmin>().storeRepository;

  static UpdateStoreUseCase get instance => getIt<UpdateStoreUseCase>();

  Future<Result<Store, MedusaError>> call(StorePostReq storePostReq) async {
    try {
      final result = await _storeRepository.update(storePostReq: storePostReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
