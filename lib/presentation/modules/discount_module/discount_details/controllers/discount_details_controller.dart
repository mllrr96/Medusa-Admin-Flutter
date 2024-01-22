import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/discount/discount_details_use_case.dart';
import 'package:medusa_admin/presentation/modules/discount_module/discounts/controllers/discounts_controller.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscountDetailsController extends GetxController
    with StateMixin<Discount> {
  DiscountDetailsController(
      {required this.discountDetailsUseCase, required this.discountId});
  final DiscountDetailsUseCase discountDetailsUseCase;
  final String discountId;
  final refreshController = RefreshController();
  @override
  Future<void> onInit() async {
    await loadDiscount();
    super.onInit();
  }

  Future<void> loadDiscount() async {
    change(null, status: RxStatus.loading());
    final result = await discountDetailsUseCase
        .retrieveDiscount(id: discountId, queryParameters: {
      'expand': 'regions,regions.currency,rule,rule.conditions',
    });

    result.when((discount) {
      refreshController.refreshCompleted();
      change(discount, status: RxStatus.success());
    }, (error) {
      refreshController.refreshFailed();
      change(null, status: RxStatus.error(error.message));
    });
  }

  Future<void> deleteDiscount(BuildContext context) async {
    loading();

    final result = await discountDetailsUseCase.deleteDiscount(id: discountId);

    result.when((success) {
      context.popRoute();
      context.showSnackBar('Promotion deleted');
      DiscountsController.instance.pagingController.refresh();
    }, (error) => context.showSnackBar(error.toSnackBarString()));
    dismissLoading();
  }

  Future<void> toggleDiscount(Discount discount, BuildContext context) async {
    loading();
    bool toggle =
        discount.isDisabled != null && discount.isDisabled! ? false : true;
    final result = await discountDetailsUseCase.updateDiscount(
        id: discount.id!,
        userUpdateDiscountReq: UserUpdateDiscountReq(isDisabled: toggle));
    result.when((success) async => await loadDiscount(),
        (error) => context.showSnackBar(error.toSnackBarString()));
    dismissLoading();
  }

  Future<void> deleteCondition(String conditionId, BuildContext context) async {
    loading();

    final result = await discountDetailsUseCase.deleteDiscountCondition(
        discountId: discountId, conditionId: conditionId);

    result.when((success) async {
      context.showSnackBar('Condition deleted');
      await loadDiscount();
    }, (error) => context.showSnackBar(error.toSnackBarString()));
    dismissLoading();
  }

  Future<void> addCondition(
      {required UserCreateConditionReq userCreateConditionReq,
      required BuildContext context}) async {
    loading();

    final result = await discountDetailsUseCase.createDiscountCondition(
        discountId: discountId, userCreateConditionReq: userCreateConditionReq);

    result.when((success) async {
      context.showSnackBar('Condition added');
      await loadDiscount();
    }, (error) => context.showSnackBar(error.toSnackBarString()));
    dismissLoading();
  }

  Future<void> updateCondition({
    required List<String> deletedItems,
    required List<String> addedItems,
    required String conditionId,
    required BuildContext context,
  }) async {
    loading();

    // Adding items
    if (addedItems.isNotEmpty) {
      final result = await discountDetailsUseCase.addBatchResources(
          discountId: discountId,
          conditionId: conditionId,
          itemIds: addedItems);
      result.when((success) async {
        context.showSnackBar('Condition items updated');
      }, (error) => context.showSnackBar(error.toSnackBarString()));
    }

    // Deleting items
    if (deletedItems.isNotEmpty) {
      final result = await discountDetailsUseCase.deleteBatchResources(
          discountId: discountId,
          conditionId: conditionId,
          itemIds: deletedItems);
      result.when((success) async {
        context.showSnackBar('Condition items updated');
      },
          (error) => context.showSnackBar(
              'Error deleting condition items, ${error.toSnackBarString()}'));
    }

    await loadDiscount();
    dismissLoading();
  }
}
