import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/draft_order/draft_order_repo.dart';
import '../../../../data/models/req/user_draft_order_req.dart';
import '../../../../data/repository/regions/regions_repo.dart';

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

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> createDraftOrder() async {
    final result = await draftOrderRepo.createDraftOrder(
        userCreateDraftOrderReq: UserCreateDraftOrderReq(
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
    result.when((success) {}, (error) {});
  }
}
