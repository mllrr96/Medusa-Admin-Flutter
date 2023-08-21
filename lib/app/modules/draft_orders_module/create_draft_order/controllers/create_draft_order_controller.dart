import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import '../../../../data/repository/regions/regions_repo.dart';

class CreateDraftOrderController extends GetxController {
  CreateDraftOrderController({required this.regionsRepo});
  static CreateDraftOrderController get instance =>
      Get.find<CreateDraftOrderController>();
  final RegionsRepo regionsRepo;
  List<ProductVariant> variants = [];
  Region? selectedRegion;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
