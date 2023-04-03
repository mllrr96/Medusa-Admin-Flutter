import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/modules/discount_module/discounts/controllers/discounts_controller.dart';

import '../../../components/easy_loading.dart';

class DiscountDetailsController extends GetxController with StateMixin<Discount> {
  DiscountDetailsController({required this.discountRepo});
  final DiscountRepo discountRepo;
  String id = Get.arguments;

  @override
  Future<void> onInit() async {
    await loadDiscount();
    super.onInit();
  }

  Future<void> loadDiscount() async {
    change(null, status: RxStatus.loading());

    final result = await discountRepo.retrieveDiscount(id: id);

    result.when((success) {
      if (success.discount != null) {
        change(success.discount, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error('Error loading discount'));
      }
    }, (error) => change(null, status: RxStatus.error(error.message)));
  }

  Future<void> deleteDiscount ()async{
    loading();

    final result = await discountRepo.deleteDiscount(id: id);

    result.when((success) {
      Get.back();
      Get.snackbar('Success', 'Promotion deleted', snackPosition: SnackPosition.BOTTOM);
      DiscountsController.instance.pagingController.refresh();
    }, (error) => Get.snackbar('Error deleting promotion ${error.code ??''}', error.message, snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }

}
