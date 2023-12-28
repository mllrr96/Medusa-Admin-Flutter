import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/components/header_card.dart';
import 'package:medusa_admin/app/modules/pricing_module/pricing/controllers/pricing_controller.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';

import '../../../../data/models/req/user_price_list_req.dart';

class AddUpdatePriceListController extends GetxController {
  AddUpdatePriceListController({required this.priceListRepo, required this.id});
  final PriceListRepo priceListRepo;
  final String? id;
  bool get updateMode => id != null;
  PriceList priceList =
      const PriceList(type: PriceListType.sale, status: PriceListStatus.active);
  final formKey = GlobalKey<FormState>();
  final priceListTypeKey = GlobalKey();
  final generalKey = GlobalKey();
  final generalController = HeaderCardController();
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
    if (!formKey.currentState!.validate()) {
      generalController.expand();
      return;
    }

    loading();
    final prices = <MoneyAmount>[];
    priceList.prices?.forEach((element) {
      prices.add(MoneyAmount(
          amount: element.amount,
          currencyCode: element.currencyCode,
          variantId: element.variantId
      ));
    });

    final result = await priceListRepo.createPriceList(
      userCreatePriceListReq: UserCreatePriceListReq(
        name: nameCtrl.text,
        description: descriptionCtrl.text,
        type: priceList.type,
        prices: prices,
        startsAt: priceList.startsAt,
        endsAt: priceList.endsAt,
        customerGroupIds: priceList.customerGroups?.map((e) => e.id!).toList(),
        status: saveAsDraft ? PriceListStatus.draft : PriceListStatus.active,
      ),
    );

    result.when((success) {
      EasyLoading.showSuccess('Price List Created');
      PricingController.instance.pagingController.refresh();
      context.popRoute();
    }, (error) {
      dismissLoading();
      context.showSnackBar(
          'Error creating price list, ${error.toSnackBarString()}');
    });
  }

  Future<void> updatePriceList(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    loading();

    final result = await priceListRepo.updatePriceList(
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
      PricingController.instance.pagingController.refresh();
      context.popRoute();
    },
        (error) => Get.snackbar(
            'Error updating price list ${error.code ?? ''}', error.message,
            snackPosition: SnackPosition.BOTTOM));
  }

  Future<void> fetchPriceList() async {
    loading();
    final result = await priceListRepo.retrievePriceList(id: id!);
    result.when(
      (success) {
        final priceList = success.priceList;
        if (priceList != null) {
          this.priceList = priceList;
          if (priceList.customerGroups?.isNotEmpty ?? false) {
            specifyCustomers = true;
          }
          saveAsDraft =
              priceList.status == PriceListStatus.active ? false : true;
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
        }
        dismissLoading();
      },
      (error) {
        debugPrint(error.toString());
        dismissLoading();
      },
    );
  }
}
