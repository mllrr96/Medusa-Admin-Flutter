import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/collection/collection_repo.dart';
import 'package:medusa_admin/app/data/repository/product_tag/product_tag_repo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductsFilterController extends GetxController
    with StateMixin<(List<ProductCollection>, List<ProductTag>)> {
  static ProductsFilterController get instance =>
      Get.find<ProductsFilterController>();

  ProductsFilterController(
      {required this.productTagRepo, required this.collectionRepo});
  final ProductTagRepo productTagRepo;
  final CollectionRepo collectionRepo;
  final refreshController = RefreshController();

  @override
  Future<void> onInit() async {
    await loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    change(null, status: RxStatus.loading());
    final collectionResult = await collectionRepo.retrieveAll();
    final tagsResult = await productTagRepo.retrieveProductTags();
    collectionResult.when((success) {
      tagsResult.when((success2) {
        change((success.collections ?? [], success2.tags ?? []),
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
