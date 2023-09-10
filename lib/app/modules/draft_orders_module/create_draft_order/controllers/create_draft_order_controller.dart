import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/draft_order/draft_order_repo.dart';
import 'package:medusa_admin/app/modules/draft_orders_module/draft_orders/controllers/draft_orders_controller.dart';
import '../../../../data/models/req/user_draft_order_req.dart';
import '../../../../data/repository/regions/regions_repo.dart';
import '../../../components/easy_loading.dart';

class CreateDraftOrderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  CreateDraftOrderController(
      {required this.regionsRepo, required this.draftOrderRepo});
  static CreateDraftOrderController get instance =>
      Get.find<CreateDraftOrderController>();
  final RegionsRepo regionsRepo;
  final DraftOrderRepo draftOrderRepo;
  late TabController tabController;

  List<LineItem> lineItems = [];
  List<LineItem> customLineItems = [];
  Customer? selectedCustomer;
  bool customCustomer = true;
  Address shippingAddress = Address();
  Address billingAddress = Address();
  bool sameAddress = false;

  Region? selectedRegion;
  ShippingOption? selectedShippingOption;
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final expansionController = ExpansionTileController();
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }


  Future<void> createDraftOrder() async {
    loading();
    final result = await draftOrderRepo.createDraftOrder(
        userCreateDraftOrderReq: UserCreateDraftOrderReq(
            discounts: [],
            email: selectedCustomer!.email,
            customerId: selectedCustomer?.id,
            regionId: selectedRegion!.id!,
            shippingMethods: [
              ShippingMethod(
                  shippingOptionId: selectedShippingOption!.id,
                  price: selectedShippingOption!.amount),
            ],
            shippingAddress: shippingAddress,
            billingAddress: sameAddress ? shippingAddress : billingAddress,
            items: [...lineItems, ...customLineItems]));
    result.when((success) {
      Get.back();
      EasyLoading.showSuccess('Draft order created');
      DraftOrdersController.instance.pagingController.refresh();
      return;
    }, (error) {
      debugPrint(error.toString());
      Get.snackbar(
          'Error creating draft order ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });

    dismissLoading();
  }
}
