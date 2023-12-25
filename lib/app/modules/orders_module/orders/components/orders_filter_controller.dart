import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/regions/regions_repo.dart';
import 'package:medusa_admin/app/data/repository/sales_channel/sales_channel_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrdersFilterController extends GetxController
    with StateMixin<(List<Region>, List<SalesChannel>)> {
  static OrdersFilterController get instance =>
      Get.find<OrdersFilterController>();
  OrdersFilterController({
    required this.regionsRepo,
    required this.salesChannelRepo,
  });
  final RegionsRepo regionsRepo;
  final SalesChannelRepo salesChannelRepo;
  final refreshController = RefreshController();

  @override
  Future<void> onInit() async {
    await loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    change(null, status: RxStatus.loading());
    final result = await regionsRepo.retrieveAll();
    final result2 = await salesChannelRepo.retrieveAll();

    result.when((success) {
      result2.when((success2) {
        change((success.regions ?? [], success2.salesChannels ?? []),
            status: RxStatus.success());
        refreshController.refreshCompleted();
      }, (error) {
        change(null, status: RxStatus.error(error.toString()));
        refreshController.refreshFailed();
      });
    }, (error) {
      change(null, status: RxStatus.error(error.toString()));
      refreshController.refreshFailed();
    });
  }
}
