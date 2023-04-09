import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount_condition.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/components/currency_formatter.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../data/models/req/discount.dart';
import '../../../../data/models/store/discount.dart';
import '../../../../data/models/store/discount_rule.dart';
import '../../../../data/models/store/region.dart';

class AddUpdateDiscountController extends GetxController {
  AddUpdateDiscountController({required this.discountRepo});
  final DiscountRepo discountRepo;
  Rx<DiscountRuleType> discountRuleType = DiscountRuleType.percentage.obs;
  Rx<AllocationType> allocationType = AllocationType.total.obs;
  RxBool hasStartDate = false.obs;
  RxBool hasEndDate = false.obs;
  RxBool hasLimit = false.obs;
  RxBool templateDiscount = false.obs;
  RxBool showTemplateDiscountInfo = false.obs;
  RxList<DiscountCondition> discountConditions = <DiscountCondition>[].obs;
  // ignore: unnecessary_cast
  Rx<DateTime?> startDate = (null as DateTime?).obs;
  // ignore: unnecessary_cast
  Rx<DateTime?> endDate = (null as DateTime?).obs;
  String? id = Get.arguments;
  bool get updateMode => id != null;
  final codeCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final percentageCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final limitCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Discount? _loadedDiscount;
  RxList<Region> selectedRegions = <Region>[].obs;
  late ScrollController scrollController;
  final discountKey = GlobalKey();
  final generalKey = GlobalKey();
  final configKey = GlobalKey();
  final conditionsKey = GlobalKey();
  @override
  void onInit() {
    if (id != null) {
      _loadDiscount();
    }
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> _loadDiscount() async {
    loading();
    final result = await discountRepo.retrieveDiscount(id: id!);
    result.when((success) {
      final discount = success.discount;
      _loadedDiscount = discount;
      final type = discount!.rule?.type;
      final allocationType = discount.rule!.allocation;
      discountRuleType.value = type!;
      selectedRegions.value = [...?discount.regions];
      switch (type) {
        case DiscountRuleType.fixed:
          this.allocationType.value = allocationType!;
          if (selectedRegions.isNotEmpty) {
            amountCtrl.text = CurrencyTextInputFormatter(name: selectedRegions.first.currencyCode)
                .format(discount.rule?.value.toString() ?? '');
          } else {
            amountCtrl.text = discount.rule?.value.toString() ?? '';
          }
          break;
        case DiscountRuleType.percentage:
          percentageCtrl.text = discount.rule?.value.toString() ?? '';
          break;
        case DiscountRuleType.freeShipping:
          break;
      }
      codeCtrl.text = discount.code ?? '';
      limitCtrl.text = discount.usageLimit?.toString() ?? '';
      descriptionCtrl.text = discount.rule?.description ?? '';

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

  Future<void> createDiscount(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (!_valid()) {
      return;
    }
    FocusScope.of(context).unfocus();
    loading();
    final value = discountRuleType.value == DiscountRuleType.percentage
        ? int.tryParse(percentageCtrl.text)
        : int.tryParse(amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), ''));

    final discount = UserCreateDiscountReq(
      startsAt: hasStartDate.value ? startDate.value : null,
      endsAt: hasEndDate.value ? endDate.value : null,
      usageLimit: hasLimit.value ? int.tryParse(limitCtrl.text) : null,
      code: codeCtrl.text,
      rule: DiscountRule(
        type: discountRuleType.value,
        conditions: discountConditions.isNotEmpty ? discountConditions : null,
        description: descriptionCtrl.text,
        value: discountRuleType.value == DiscountRuleType.freeShipping ? 0 : value,
        allocation: discountRuleType.value == DiscountRuleType.fixed ? allocationType.value : AllocationType.total,
      ),
      regionsIds: selectedRegions.map((e) => e.id!).toList(),
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

  Future<void> updateDiscount(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (!_valid()) {
      return;
    }
    if (sameDiscount()) {
      Get.back();
      return;
    }
    FocusScope.of(context).unfocus();
    loading();
    final value = discountRuleType.value == DiscountRuleType.percentage
        ? int.tryParse(percentageCtrl.text)
        : int.tryParse(amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), ''));

    final updatedDiscount = UserUpdateDiscountReq(
      startsAt: hasStartDate.value ? startDate.value : null,
      endsAt: hasEndDate.value ? endDate.value : null,
      usageLimit: hasLimit.value ? int.tryParse(limitCtrl.text) : null,
      code: codeCtrl.text,
      rule: DiscountRule(
        id: _loadedDiscount!.ruleId,
        description: descriptionCtrl.text,
        value: discountRuleType.value == DiscountRuleType.freeShipping ? 0 : value,
      ),
      regionsIds: selectedRegions.map((e) => e.id!).toList(),
    );

    final result = await discountRepo.updateDiscount(id: id!, userUpdateDiscountReq: updatedDiscount);

    result.when((success) {
      Get.back(result: true);
      EasyLoading.showSuccess('Discount updated!');
    }, (error) {
      dismissLoading();
      Get.snackbar('Error updating discount ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM);
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

    if (startDate.value != null && endDate.value != null && endDate.value!.isBefore(startDate.value!)) {
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

  bool sameDiscount() {
    final value = discountRuleType.value == DiscountRuleType.percentage
        ? int.tryParse(percentageCtrl.text)
        : int.tryParse(amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), ''));
    final a = _loadedDiscount!;
    final b = Discount(
      startsAt: startDate.value,
      endsAt: endDate.value,
      usageLimit: int.tryParse(limitCtrl.text),
      code: codeCtrl.text,
      rule: DiscountRule(
        id: _loadedDiscount!.ruleId,
        description: descriptionCtrl.text,
        value: discountRuleType.value == DiscountRuleType.freeShipping ? 0 : value,
      ),
      regions: selectedRegions.map((e) => e).toList(),
    );
    if (a.startsAt == b.startsAt &&
        a.endsAt == b.endsAt &&
        (a.regions?.map((e) => e.id!).toList().listEquals(b.regions?.map((e) => e.id!).toList() ?? []) ?? false) &&
        a.usageLimit == b.usageLimit &&
        a.code == b.code &&
        a.rule?.id == b.rule?.id &&
        a.rule?.description == b.rule?.description &&
        a.rule?.value == b.rule?.value) {
      return true;
    }
    return false;
  }
}
