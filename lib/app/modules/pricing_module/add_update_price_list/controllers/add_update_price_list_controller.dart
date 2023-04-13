import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/price_list/price_list_repo.dart';

import '../../../../data/models/req/user_price_list_req.dart';

class AddUpdatePriceListController extends GetxController {
  AddUpdatePriceListController({required this.priceListRepo});
  final PriceListRepo priceListRepo;
  final String? id = Get.arguments;
  bool get updateMode => id != null;
  PriceList priceList = const PriceList(type: PriceListType.sale, status: PriceListStatus.active);
  final formKey = GlobalKey<FormState>();
  final priceListTypeKey = GlobalKey();
  final generalKey = GlobalKey();
  final configKey = GlobalKey();
  final pricesKey = GlobalKey();
  final scrollController = ScrollController();
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  //
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> create() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final result = await priceListRepo.createPriceList(
      userCreatePriceListReq: UserCreatePriceListReq(
        name: priceList.name!,
        description: '',
        type: priceList.type,
        prices: [],
        startsAt: priceList.startsAt,
        endsAt: priceList.endsAt,
        customerGroupIds: priceList.customerGroups?.map((e) => e.id!).toList(),
        status: priceList.status,
      ),
    );

    result.when((success) => null, (error) => null);
  }
}
