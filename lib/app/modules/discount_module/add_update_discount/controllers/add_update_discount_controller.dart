import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

import '../../../../data/models/req/discount.dart';
import '../../../../data/models/store/discount_rule.dart';

class AddUpdateDiscountController extends GetxController {
  AddUpdateDiscountController({required this.discountRepo});
  final DiscountRepo discountRepo;
  Rx<DiscountRuleType> discountRuleType = DiscountRuleType.percentage.obs;
  Rx<AllocationType> allocationType = AllocationType.total.obs;
  RxBool hasStartDate = false.obs;
  RxBool hasEndDate = false.obs;
  RxBool hasLimit = false.obs;
  RxBool templateDiscount = false.obs;
  Rx<DateTime?> startDate = (null as DateTime?).obs;
  Rx<DateTime?> endDate = (null as DateTime?).obs;
  String? id = Get.arguments;
  bool get updateMode => id != null;
  final codeCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final percentageCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final limitCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (id != null) {
      _loadDiscount();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _loadDiscount() async {
    loading();
    final result = await discountRepo.retrieveDiscount(id: id!);
    result.when((success) {
      final discount = success.discount;
      final type = discount!.rule?.type;
      final allocationType = discount.rule!.allocation;

      discountRuleType.value = type!;
      if (type == DiscountRuleType.fixed) {
        this.allocationType.value = allocationType!;
      }
      codeCtrl.text = discount.code ?? '';
      amountCtrl.text = discount.rule?.value.toString() ?? '';
      limitCtrl.text = discount.usageLimit?.toString() ?? '';

      if (discount.startsAt != null) {
        hasStartDate.value = true;
        startDate.value = discount.startsAt;
      }
      if (discount.endsAt != null) {
        hasEndDate.value = true;
        endDate.value = discount.endsAt;
      }
    }, (error) {
      Get.back();
      Get.snackbar('Error loading discount ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
    });
    dismissLoading();
  }

  Future<void> createDiscount() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (!_valid()) {
      return;
    }
    loading();
    final value = discountRuleType.value == DiscountRuleType.percentage
        ? int.tryParse(percentageCtrl.text)
        : int.tryParse(amountCtrl.text);

    final discount = UserCreateDiscountReq(
      startsAt: hasStartDate.value ? startDate.value : null,
      endsAt: hasEndDate.value ? endDate.value : null,
      usageLimit: hasLimit.value ? int.tryParse(limitCtrl.text) : null,
      code: codeCtrl.text,
      rule: DiscountRule(
        type: discountRuleType.value,
        value: discountRuleType.value == DiscountRuleType.freeShipping ? 0 : value,
        allocation: discountRuleType.value == DiscountRuleType.fixed ? allocationType.value : AllocationType.total,
      ),
      regionsId: ['reg_01GWZGA9Z88F814AH8TZJWQ6F0'],
    );

    final result = await discountRepo.createDiscount(userCreateDiscountReq: discount);

    result.when((success) {
      Get.back(result: true);
      EasyLoading.showSuccess('Discount created!');
    }, (error) {
      dismissLoading();
      Get.snackbar('Error creating discount ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> updateDiscount() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (!_valid()) {
      return;
    }
    loading();
    final value = discountRuleType.value == DiscountRuleType.percentage
        ? int.tryParse(percentageCtrl.text)
        : int.tryParse(amountCtrl.text);

    final updatedDiscount = UserUpdateDiscountReq(
      startsAt: hasStartDate.value ? startDate.value : null,
      endsAt: hasEndDate.value ? endDate.value : null,
      usageLimit: hasLimit.value ? int.tryParse(limitCtrl.text) : null,
      code: codeCtrl.text,
      rule: DiscountRule(
        type: discountRuleType.value,
        value: discountRuleType.value == DiscountRuleType.freeShipping ? 0 : value,
        allocation: discountRuleType.value == DiscountRuleType.fixed ? allocationType.value : AllocationType.total,
      ),
      regionsId: ['reg_01GWZGA9Z88F814AH8TZJWQ6F0'],
    );

    final result = await discountRepo.updateDiscount(id: '', userUpdateDiscountReq: updatedDiscount);

    result.when((success) {
      Get.back(result: true);
      EasyLoading.showSuccess('Discount created!');
    }, (error) {
      dismissLoading();
      Get.snackbar('Error creating discount ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
    });
  }

  bool _valid() {
    String title = '';
    String message = '';
    if (hasStartDate.value && startDate.value == null) {
      title = 'Field is required';
      message = 'Please select start date';
    }

    if (hasEndDate.value && endDate.value == null) {
      title = 'Field is required';
      message = 'Please select expiry date';
    }

    if (startDate.value != null && endDate.value != null && endDate.value!.isAfter(startDate.value!)) {
      title = 'Error';
      message = 'Expiry date should be after start date';
    }

    if (title.isEmpty) {
      return true;
    } else {
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM, icon: const Icon(Icons.warning_rounded, color: Colors.red));
      return false;
    }
  }
}
