import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

class RegionsUseCase {
  final RegionsRepository _regionsRepository =
      getIt<MedusaAdmin>().regionsRepository;

  static RegionsUseCase get instance => getIt<RegionsUseCase>();

  Future<Result<UserRegionsRes, Failure>> call(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _regionsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
