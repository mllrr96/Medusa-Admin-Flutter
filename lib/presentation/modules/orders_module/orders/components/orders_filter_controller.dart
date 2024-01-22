import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/order/orders_filter_use_case.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class OrdersFilterController extends GetxController
    with StateMixin<(List<Region>, List<SalesChannel>)> {
  static OrdersFilterController get instance =>
      Get.find<OrdersFilterController>();
  OrdersFilterController( this.ordersFilterUseCase);
  final OrdersFilterUseCase ordersFilterUseCase;
  final refreshController = RefreshController();

  @override
  Future<void> onInit() async {
    await loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    change(null, status: RxStatus.loading());
    final result = await ordersFilterUseCase();

    result.when((success) {
      change((success.$1.regions!, success.$2.salesChannels!),
          status: RxStatus.success());
      refreshController.refreshCompleted();
    }, (error) {
      change(null, status: RxStatus.error(error.toString()));
      refreshController.refreshFailed();
    });
  }
}
