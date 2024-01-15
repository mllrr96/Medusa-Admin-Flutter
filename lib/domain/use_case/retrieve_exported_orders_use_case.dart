import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class RetrieveExportedOrdersUseCase {
  BatchJobsRepository get _batchJobsRepository =>
      getIt<MedusaAdmin>().batchJobsRepository;

  static RetrieveExportedOrdersUseCase get instance =>
      getIt<RetrieveExportedOrdersUseCase>();

  Future<Result<List<BatchJob>, Failure>> call(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _batchJobsRepository.retrieveBatchJobs(
          queryParameters: queryParameters);
      if (result != null) {
        return Success(result.batchJobs ?? []);
      } else {
        return Error(
            Failure.from('Error retrieving exported orders, unknown error'));
      }
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
