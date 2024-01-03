import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateStoreUseCase {
  final StoreRepository _storeRepository = getIt<MedusaAdmin>().storeRepository;

  static UpdateStoreUseCase get instance => getIt<UpdateStoreUseCase>();

  Future<Result<Store, Failure>> call(StorePostReq storePostReq) async {
    try {
      final result = await _storeRepository.update(storePostReq: storePostReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
