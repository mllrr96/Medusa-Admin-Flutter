import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/products_filter_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductsFilterController extends GetxController
    with StateMixin<(List<ProductCollection>, List<ProductTag>)> {
  static ProductsFilterController get instance =>
      Get.find<ProductsFilterController>();

  ProductsFilterController(this.productsFilterUseCase);
  final ProductsFilterUseCase productsFilterUseCase;
  final refreshController = RefreshController();

  @override
  Future<void> onInit() async {
    await loadData();
    super.onInit();
  }


  Future<void> loadData() async {
    change(null, status: RxStatus.loading());
    final result = await productsFilterUseCase();

    result.when((success) {
      change((success.$1.collections!, success.$2.tags!),
          status: RxStatus.success());
      refreshController.refreshCompleted();
    }, (error) {
      change(null, status: RxStatus.error(error.toString()));
      refreshController.refreshFailed();
    });
  }
}
