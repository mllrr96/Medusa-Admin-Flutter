import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/data/repository/discount_condition/discount_condition_repo.dart';
import 'package:medusa_admin/app/modules/discount_module/discounts/controllers/discounts_controller.dart';
import 'package:medusa_admin/core/utils/extensions/snack_bar_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../data/models/req/discount.dart';
import '../../../../data/models/req/user_discount_condition_req.dart';
import '../../../components/easy_loading.dart';

class DiscountDetailsController extends GetxController
    with StateMixin<Discount> {
  DiscountDetailsController(
      {required this.discountRepo,
      required this.discountConditionRepo,
      required this.discountId});
  final DiscountRepo discountRepo;
  final DiscountConditionRepo discountConditionRepo;
  final String discountId;
  final refreshController = RefreshController();
  @override
  Future<void> onInit() async {
    await loadDiscount();
    super.onInit();
  }

  Future<void> loadDiscount() async {
    change(null, status: RxStatus.loading());
    final result =
        await discountRepo.retrieveDiscount(id: discountId, queryParameters: {
      'expand': 'regions,regions.currency,rule,rule.conditions',
    });

    result.when((success) {
      if (success.discount != null) {
        refreshController.refreshCompleted();
        change(success.discount, status: RxStatus.success());
      } else {
        refreshController.refreshFailed();
        change(null, status: RxStatus.error('Error loading discount'));
      }
    }, (error) {
      refreshController.refreshFailed();
      change(null, status: RxStatus.error(error.message));
    });
  }

  Future<void> deleteDiscount(BuildContext context) async {
    loading();

    final result = await discountRepo.deleteDiscount(id: discountId);

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
    final result = await discountRepo.updateDiscount(
        id: discount.id!,
        userUpdateDiscountReq: UserUpdateDiscountReq(isDisabled: toggle));
    result.when((success) async => await loadDiscount(),
        (error) => context.showSnackBar(error.toSnackBarString()));
    dismissLoading();
  }

  Future<void> deleteCondition(String conditionId, BuildContext context) async {
    loading();

    final result = await discountConditionRepo.deleteDiscountCondition(
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

    final result = await discountConditionRepo.createDiscountCondition(
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
      final result = await discountConditionRepo.addBatchResources(
          discountId: discountId,
          conditionId: conditionId,
          itemIds: addedItems);
      result.when((success) async {
        context.showSnackBar('Condition items updated');
      }, (error) => context.showSnackBar(error.toSnackBarString()));
    }

    // Deleting items
    if (deletedItems.isNotEmpty) {
      final result = await discountConditionRepo.deleteBatchResources(
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
