import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/list_extension.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/domain/use_case/discount/update_discount_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class AddUpdateDiscountController extends GetxController {
  AddUpdateDiscountController(
      {required this.updateDiscountUseCase, this.discount});
  final UpdateDiscountUseCase updateDiscountUseCase;
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
  final Discount? discount;
  bool get updateMode => discount != null;
  final codeCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final percentageCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final limitCtrl = TextEditingController();
  final regionCtrl = TextEditingController();
  final generalFormKey = GlobalKey<FormState>();
  final configFormKey = GlobalKey<FormState>();
  Discount? _loadedDiscount;
  List<Region> selectedRegions = <Region>[];
  late ScrollController scrollController;
  final discountKey = GlobalKey();
  final generalKey = GlobalKey();
  final configKey = GlobalKey();
  final conditionsKey = GlobalKey();
  final generalTileController = FlexExpansionTileController();
  final configTileController = FlexExpansionTileController();
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
          amountCtrl.text = discount?.rule?.value.formatAsPrice(
                  selectedRegions.first.currencyCode,
                  includeSymbol: false) ??
              '';
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
    discount!.usageLimit != null ? hasLimit = true : hasLimit = false;
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
    if (!generalFormKey.currentState!.validate()) {
      generalTileController.expand();
      return;
    }

    if (!configFormKey.currentState!.validate()) {
      configTileController.expand();
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
        value: discountRuleType == DiscountRuleType.freeShipping ? 0 : value,
        allocation: discountRuleType == DiscountRuleType.fixed
            ? allocationType
            : AllocationType.total,
      ),
      regionsIds: selectedRegions.map((e) => e.id!).toList(),
    );

    final result = await updateDiscountUseCase.createDiscount(
        userCreateDiscountReq: discount);

    result.when((success) {
      context.popRoute(true);
      EasyLoading.showSuccess('Discount created!');
    }, (error) {
      dismissLoading();
      context.showSnackBar(error.toSnackBarString());
    });
  }

  Future<void> updateDiscount(BuildContext context) async {
    if (!generalFormKey.currentState!.validate()) {
      generalTileController.expand();
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
      nullEndAt: !hasEndDate,
      usageLimit: hasLimit ? int.tryParse(limitCtrl.text) : null,
      code: codeCtrl.text,
      rule: DiscountRule(
        id: _loadedDiscount!.ruleId,
        description: descriptionCtrl.text,
        value: discountRuleType == DiscountRuleType.freeShipping ? 0 : value,
        type: null,
      ),
      regionsIds: selectedRegions.map((e) => e.id!).toList(),
    );

    final result = await updateDiscountUseCase.updateDiscount(
        id: discount!.id!, userUpdateDiscountReq: updatedDiscount);

    result.when((success) {
      context.router.popForced(true);
      EasyLoading.showSuccess('Discount updated!');
    }, (error) {
      dismissLoading();
      context.showSnackBar(error.toSnackBarString());
    });
  }

  bool sameDiscount() {
    final value = discountRuleType == DiscountRuleType.percentage
        ? int.tryParse(percentageCtrl.text)
        : int.tryParse(amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), ''));
    final a = _loadedDiscount;
    final b = Discount(
      startsAt: startDate,
      endsAt: endDate,
      usageLimit: int.tryParse(limitCtrl.text),
      code: codeCtrl.text,
      rule: DiscountRule(
        id: _loadedDiscount?.ruleId,
        description: descriptionCtrl.text,
        value: discountRuleType == DiscountRuleType.freeShipping ? 0 : value,
        type: null,
      ),
      regions: selectedRegions.map((e) => e).toList(),
      isDynamic: null,
    );
    if (a?.startsAt == b.startsAt &&
        a?.endsAt == b.endsAt &&
        (a?.regions
                ?.map((e) => e.id!)
                .toList()
                .listEquals(b.regions?.map((e) => e.id!).toList() ?? []) ??
            false) &&
        a?.usageLimit == b.usageLimit &&
        a?.code == b.code &&
        a?.rule?.id == b.rule?.id &&
        a?.rule?.description == b.rule?.description &&
        a?.rule?.value == b.rule?.value) {
      return true;
    }
    return false;
  }
}
