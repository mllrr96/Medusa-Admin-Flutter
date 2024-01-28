import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/draft_order/create_draft_use_case.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';

class CreateDraftOrderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  CreateDraftOrderController(
      {required this.createDraftUseCase});
  static CreateDraftOrderController get instance =>
      Get.find<CreateDraftOrderController>();
  final CreateDraftUseCase createDraftUseCase;
  late TabController tabController;

  List<LineItem> lineItems = [];
  List<LineItem> customLineItems = [];
  Customer? selectedCustomer;
  bool customCustomer = true;
  Address shippingAddress = const Address();
  Address billingAddress = const Address();
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

  Future<void> createDraftOrder(BuildContext context) async {
    loading();
    final result = await createDraftUseCase(
        UserCreateDraftOrderReq(
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
      context.popRoute();
      EasyLoading.showSuccess('Draft order created');
      // DraftOrdersController.instance.pagingController.refresh();
      return;
    },
        (error) => context.showSnackBar(
            'Error creating draft order ${error.toSnackBarString()}'));

    dismissLoading();
  }
}
