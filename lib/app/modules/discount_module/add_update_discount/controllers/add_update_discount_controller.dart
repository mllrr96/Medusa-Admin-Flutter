import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount_condition.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../data/models/req/discount.dart';
import '../../../../data/models/store/discount.dart';
import '../../../../data/models/store/discount_rule.dart';
import '../../../../data/models/store/region.dart';

class AddUpdateDiscountController extends GetxController {
  AddUpdateDiscountController({required this.discountRepo,this.discount });
  final DiscountRepo discountRepo;
  DiscountRuleType discountRuleType = DiscountRuleType.percentage;
  AllocationType allocationType = AllocationType.total;
  bool hasStartDate = false;
  bool hasEndDate = false;
  bool hasLimit = false;
  bool templateDiscount = false;
  bool showTemplateDiscountInfo = false;
  List<DiscountCondition> discountConditions = <DiscountCondition>[];
  DateTime? startDate;
  DateTime? endDate;
  final Discount? discount ;
  bool get updateMode => discount != null;
  final codeCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final percentageCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final limitCtrl = TextEditingController();
  final regionCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Discount? _loadedDiscount;
  List<Region> selectedRegions = <Region>[];
  late ScrollController scrollController;
  final discountKey = GlobalKey();
  final generalKey = GlobalKey();
  final configKey = GlobalKey();
  final conditionsKey = GlobalKey();
  final generalTileController = ExpansionTileController();
  final configTileController = ExpansionTileController();
  @override
  void onInit() {
    if (discount != null) {
      _loadDiscount();
    }
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    codeCtrl.dispose();
    amountCtrl.dispose();
    percentageCtrl.dispose();
    limitCtrl.dispose();
    regionCtrl.dispose();
    super.onClose();
  }

  Future<void> _loadDiscount() async {
    if (discount == null) {
      return;
    }
    _loadedDiscount = discount;
    final type = discount!.rule?.type;
    final allocationType = discount!.rule!.allocation;
    discountRuleType = type!;
    selectedRegions = [...?discount!.regions];
    switch (type) {
      case DiscountRuleType.fixed:
        this.allocationType = allocationType!;
        if (selectedRegions.isNotEmpty) {
          amountCtrl.text = discount?.rule?.value.formatAsPrice(selectedRegions.first.currencyCode, includeSymbol: false) ?? '';
        } else {
          amountCtrl.text = discount!.rule?.value.toString() ?? '';
        }
        break;
      case DiscountRuleType.percentage:
        percentageCtrl.text = discount!.rule?.value.toString() ?? '';
        break;
      case DiscountRuleType.freeShipping:
        break;
    }
    codeCtrl.text = discount!.code ?? '';
    limitCtrl.text = discount!.usageLimit?.toString() ?? '';
    descriptionCtrl.text = discount!.rule?.description ?? '';
    regionCtrl.text = discount!.regions
            ?.map((e) => e.name)
            .toList()
            .toString()
            .replaceAll('[', '')
            .replaceAll(']', '') ??
        '';

    if (discount!.startsAt != null) {
      hasStartDate = true;
      startDate = discount!.startsAt;
    }
    if (discount!.endsAt != null) {
      hasEndDate = true;
      endDate = discount!.endsAt;
    }
  }

  Future<void> createDiscount(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      if (!generalTileController.isExpanded) {
        generalTileController.expand();
      }
      return;
    }
    if (!_valid()) {
      if(generalTileController.isExpanded){
        generalTileController.collapse();
      }
      if(!configTileController.isExpanded){
        configTileController.expand();
      }
      return;
    }
    context.unfocus();
    loading();
    final value = discountRuleType == DiscountRuleType.percentage
        ? int.tryParse(percentageCtrl.text)
        : int.tryParse(amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), ''));

    final discount = UserCreateDiscountReq(
      startsAt: hasStartDate ? startDate : null,
      endsAt: hasEndDate ? endDate : null,
      usageLimit: hasLimit ? int.tryParse(limitCtrl.text) : null,
      code: codeCtrl.text,
      rule: DiscountRule(
        type: discountRuleType,
        conditions: discountConditions.isNotEmpty ? discountConditions : null,
        description: descriptionCtrl.text,
        value:
            discountRuleType == DiscountRuleType.freeShipping ? 0 : value,
        allocation: discountRuleType == DiscountRuleType.fixed
            ? allocationType
            : AllocationType.total,
      ),
      regionsIds: selectedRegions.map((e) => e.id!).toList(),
    );

    final result =
        await discountRepo.createDiscount(userCreateDiscountReq: discount);

    result.when((success) {
      context.popRoute(true);
      EasyLoading.showSuccess('Discount created!');
    }, (error) {
      dismissLoading();
      Get.snackbar('Error creating discount ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> updateDiscount(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      if (!generalTileController.isExpanded) {
        generalTileController.expand();
      }
      return;
    }
    if (!_valid()) {
      if(generalTileController.isExpanded){
        generalTileController.collapse();
      }
      if(!configTileController.isExpanded){
        configTileController.expand();
      }
      return;
    }
    if (sameDiscount()) {
      context.popRoute();
      return;
    }
    context.unfocus();
    loading();
    final value = discountRuleType == DiscountRuleType.percentage
        ? int.tryParse(percentageCtrl.text)
        : int.tryParse(amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), ''));

    final updatedDiscount = UserUpdateDiscountReq(
      startsAt: hasStartDate ? startDate : null,
      endsAt: hasEndDate ? endDate : null,
      usageLimit: hasLimit ? int.tryParse(limitCtrl.text) : null,
      code: codeCtrl.text,
      rule: DiscountRule(
        id: _loadedDiscount!.ruleId,
        description: descriptionCtrl.text,
        value:
            discountRuleType == DiscountRuleType.freeShipping ? 0 : value,
      ),
      regionsIds: selectedRegions.map((e) => e.id!).toList(),
    );

    final result = await discountRepo.updateDiscount(
        id: discount!.id!, userUpdateDiscountReq: updatedDiscount);

    result.when((success) {
      context.popRoute(true);
      EasyLoading.showSuccess('Discount updated!');
    }, (error) {
      dismissLoading();
      Get.snackbar('Error updating discount ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  bool _valid() {
    String title = '';
    String message = '';
    if (hasStartDate && startDate == null) {
      title = 'Field is required';
      message = 'Please select start date';
    }

    if (hasEndDate && endDate == null) {
      title = 'Field is required';
      message = 'Please select expiry date';
    }

    if (startDate != null &&
        endDate != null &&
        endDate!.isBefore(startDate!)) {
      title = 'Error';
      message = 'Expiry date should be after start date';
    }

    if (title.isEmpty) {
      return true;
    } else {
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.warning_rounded, color: Colors.red));
      return false;
    }
  }

  bool sameDiscount() {
    final value = discountRuleType == DiscountRuleType.percentage
        ? int.tryParse(percentageCtrl.text)
        : int.tryParse(amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), ''));
    final a = _loadedDiscount!;
    final b = Discount(
      startsAt: startDate,
      endsAt: endDate,
      usageLimit: int.tryParse(limitCtrl.text),
      code: codeCtrl.text,
      rule: DiscountRule(
        id: _loadedDiscount!.ruleId,
        description: descriptionCtrl.text,
        value:
            discountRuleType == DiscountRuleType.freeShipping ? 0 : value,
      ),
      regions: selectedRegions.map((e) => e).toList(),
    );
    if (a.startsAt == b.startsAt &&
        a.endsAt == b.endsAt &&
        (a.regions
                ?.map((e) => e.id!)
                .toList()
                .listEquals(b.regions?.map((e) => e.id!).toList() ?? []) ??
            false) &&
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
