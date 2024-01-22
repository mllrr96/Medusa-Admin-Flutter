import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/batch_job/fetch_bach_job_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class ImportProductsController extends GetxController
    with StateMixin<BatchJob> {
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  Future<void> fetchBatchJob(String id, {bool showLoading = true}) async {
    if (showLoading) {
      change(null, status: RxStatus.loading());
    }
    final result = await FetchBatchJobUseCase.instance(id);
    result.when((batchJob) {
      change(batchJob, status: RxStatus.success());
    }, (error) {
      change(null, status: RxStatus.error(error.message));
    });
  }

  void resetState() {
    change(null, status: RxStatus.empty());
  }
}
