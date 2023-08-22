import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/draft_order/draft_order_repo.dart';
import '../../../../data/repository/regions/regions_repo.dart';

class CreateDraftOrderController extends GetxController {
  CreateDraftOrderController({required this.regionsRepo, required this.draftOrderRepo});
  static CreateDraftOrderController get instance =>
      Get.find<CreateDraftOrderController>();
  final RegionsRepo regionsRepo;
  final DraftOrderRepo draftOrderRepo;

  List<LineItem> lineItems = [];
  List<LineItem> customLineItems = [];

  Region? selectedRegion;
  ShippingOption? selectedShippingOption;
  final formKey = GlobalKey<FormState>();
  final expansionController = ExpansionTileController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
