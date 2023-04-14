import 'package:flutter/cupertino.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/data/repository/discount/discount_repo.dart';
import 'package:medusa_admin/app/data/repository/discount_condition/discount_condition_repo.dart';
import 'package:medusa_admin/app/modules/discount_module/discounts/controllers/discounts_controller.dart';

import '../../../../data/models/req/discount.dart';
import '../../../../data/models/req/user_discount_condition_req.dart';
import '../../../components/easy_loading.dart';

class DiscountDetailsController extends GetxController with StateMixin<Discount> {
  DiscountDetailsController({required this.discountRepo, required this.discountConditionRepo});
  final DiscountRepo discountRepo;
  final DiscountConditionRepo discountConditionRepo;
  String id = Get.arguments;
  final fabKey = GlobalKey<ExpandableFabState>();
  @override
  Future<void> onInit() async {
    await loadDiscount();
    super.onInit();
  }

  Future<void> loadDiscount() async {
    change(null, status: RxStatus.loading());

    final result = await discountRepo.retrieveDiscount(id: id, queryParameters: {
      'expand': 'regions,regions.currency,rule,rule.conditions',
    });

    result.when((success) {
      if (success.discount != null) {
        change(success.discount, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error('Error loading discount'));
      }
    }, (error) => change(null, status: RxStatus.error(error.message)));
  }

  Future<void> deleteDiscount() async {
    loading();

    final result = await discountRepo.deleteDiscount(id: id);

    result.when((success) {
      Get.back();
      Get.snackbar('Success', 'Promotion deleted', snackPosition: SnackPosition.BOTTOM);
      DiscountsController.instance.pagingController.refresh();
    },
        (error) => Get.snackbar('Error deleting promotion ${error.code ?? ''}', error.message,
            snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }

  Future<void> toggleDiscount({required Discount discount}) async {
    loading();
    bool toggle = discount.isDisabled != null && discount.isDisabled! ? false : true;
    final result = await discountRepo.updateDiscount(
        id: discount.id!, userUpdateDiscountReq: UserUpdateDiscountReq(isDisabled: toggle));
    result.when((success) async => await loadDiscount(),
        (error) => Get.snackbar('Error ${error.code ?? ''}', error.message, snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }

  Future<void> deleteCondition(String conditionId) async {
    loading();

    final result = await discountConditionRepo.deleteDiscountCondition(discountId: id, conditionId: conditionId);

    result.when((success) async {
      if (success.deleted) {
        Get.snackbar('Success', 'Condition deleted', snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error deleting Condition', 'Unknown error', snackPosition: SnackPosition.BOTTOM);
      }
      await loadDiscount();
    },
        (error) => Get.snackbar('Error deleting Condition ${error.code ?? ''}', error.message,
            snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }

  Future<void> addCondition({required UserCreateConditionReq userCreateConditionReq}) async {
    loading();

    final result = await discountConditionRepo.createDiscountCondition(
        discountId: id, userCreateConditionReq: userCreateConditionReq);

    result.when((success) async {
      if (success.discount != null) {
        Get.snackbar('Success', 'Condition added', snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error adding Condition', 'Unknown error', snackPosition: SnackPosition.BOTTOM);
      }
      await loadDiscount();
    },
        (error) => Get.snackbar('Error adding Condition ${error.code ?? ''}', error.message,
            snackPosition: SnackPosition.BOTTOM));
    dismissLoading();
  }

  Future<void> updateCondition({
    required List<String> deletedItems,
    required List<String> addedItems,
    required String conditionId,
  }) async {
    loading();

    if (addedItems.isNotEmpty) {
      final result =
          await discountConditionRepo.addBatchResources(discountId: id, conditionId: conditionId, itemIds: addedItems);
      result.when((success) async {
        if (success.discount != null) {
          Get.snackbar('Success', 'Condition items updated', snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Error adding Condition items', 'Unknown error', snackPosition: SnackPosition.BOTTOM);
        }
      },
          (error) => Get.snackbar('Error adding Condition items ${error.code ?? ''}', error.message,
              snackPosition: SnackPosition.BOTTOM));
    }

    if (deletedItems.isNotEmpty) {
      final result = await discountConditionRepo.deleteBatchResources(
          discountId: id, conditionId: conditionId, itemIds: deletedItems);
      result.when((success) async {
        if (success.discount != null) {
          Get.snackbar('Success', 'Condition items updated', snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Error deleting Condition items', 'Unknown error', snackPosition: SnackPosition.BOTTOM);
        }
      },
          (error) => Get.snackbar('Error deleting Condition items ${error.code ?? ''}', error.message,
              snackPosition: SnackPosition.BOTTOM));
    }

    await loadDiscount();
    dismissLoading();
  }
}
