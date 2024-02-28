import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/domain/use_case/price_list/update_price_list_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class AddUpdatePriceListController extends GetxController {
  AddUpdatePriceListController(
      {required this.updatePriceListUseCase, required this.id});
  final UpdatePriceListUseCase updatePriceListUseCase;
  final String? id;
  bool get updateMode => id != null;
  PriceList priceList =
      const PriceList(type: PriceListType.sale, status: PriceListStatus.active);
  final configFormKey = GlobalKey<FormState>();
  final generalFormKey = GlobalKey<FormState>();
  final priceListTypeKey = GlobalKey();
  final generalKey = GlobalKey();
  final generalController = FlexExpansionTileController();
  final configController = FlexExpansionTileController();
  final configKey = GlobalKey();
  final pricesKey = GlobalKey();
  bool specifyCustomers = false;
  final groupCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  List<Product> products = [];
  bool saveAsDraft = false;
  @override
  Future<void> onInit() async {
    if (updateMode) {
      await fetchPriceList();
    }
    super.onInit();
  }

  @override
  void onClose() {
    groupCtrl.dispose();
    nameCtrl.dispose();
    descriptionCtrl.dispose();
    super.onClose();
  }

  Future<void> create(BuildContext context) async {
    if (!generalFormKey.currentState!.validate()) {
      generalController.expand();
      return;
    }
    if (!configFormKey.currentState!.validate()) {
      configController.expand();
      return;
    }
    context.unfocus();
    loading();
    final result = await updatePriceListUseCase.create(
      UserCreatePriceListReq(
        name: nameCtrl.text,
        description: descriptionCtrl.text,
        type: priceList.type,
        prices: priceList.prices
                ?.map((e) => MoneyAmount(
                      amount: e.amount,
                      currencyCode: e.currencyCode,
                      variantId: e.variantId,
                    ))
                .toList() ??
            [],
        startsAt: priceList.startsAt,
        endsAt: priceList.endsAt,
        customerGroupIds: priceList.customerGroups?.map((e) => e.id!).toList(),
        status: saveAsDraft ? PriceListStatus.draft : PriceListStatus.active,
      ),
    );

    result.when((success) {
      EasyLoading.showSuccess('Price List Created');
      // PricingController.instance.pagingController.refresh();
      context.popRoute();
    }, (error) {
      dismissLoading();
      context.showSnackBar(
          'Error creating price list, ${error.toSnackBarString()}');
    });
  }

  Future<void> updatePriceList(BuildContext context) async {
    if (!generalFormKey.currentState!.validate()) {
      return;
    }
    context.unfocus();
    loading();

    final result = await updatePriceListUseCase.update(
      id: id!,
      userUpdatePriceListReq: UserUpdatePriceListReq(
        name: nameCtrl.text,
        description: descriptionCtrl.text,
        type: priceList.type,
        startsAt: priceList.startsAt,
        endsAt: priceList.endsAt,
        customerGroupIds: priceList.customerGroups?.map((e) => e.id!).toList(),
        status: saveAsDraft ? PriceListStatus.draft : PriceListStatus.active,
      ),
    );

    result.when((success) {
      EasyLoading.showSuccess('Price List Updated');
      // PricingController.instance.pagingController.refresh();
      context.popRoute();
    }, (error) {
      dismissLoading();
      context.showSnackBar(
          'Error updating price list, ${error.toSnackBarString()}');
    });
  }

  Future<void> fetchPriceList() async {
    loading();
    final result = await updatePriceListUseCase.fetch(id: id!);
    result.when(
      (result) {
        priceList = result;
        if (priceList.customerGroups?.isNotEmpty ?? false) {
          specifyCustomers = true;
        }
        saveAsDraft = priceList.status == PriceListStatus.active ? false : true;
        nameCtrl.text = priceList.name ?? '';
        descriptionCtrl.text = priceList.description ?? '';
        groupCtrl.text = priceList.customerGroups
                ?.map((e) => e.name)
                .toList()
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '') ??
            '';
        update();

        dismissLoading();
      },
      (error) {
        debugPrint(error.toString());
        dismissLoading();
      },
    );
  }
}
