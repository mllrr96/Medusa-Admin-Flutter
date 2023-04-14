import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/discount_module/discount_details/controllers/discount_details_controller.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../../../routes/app_pages.dart';
import '../../discounts/controllers/discounts_controller.dart';

class DiscountDetailsFab extends GetView<DiscountDetailsController> {
  const DiscountDetailsFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (discount) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    onPressed: () async {
                      await showOkCancelAlertDialog(
                              context: context,
                              title: 'Delete Promotion',
                              message: 'Are you sure you want to delete this promotion?',
                              okLabel: 'Yes, delete',
                              cancelLabel: 'Cancel',
                              isDestructiveAction: true)
                          .then((value) async {
                        if (value == OkCancelResult.ok) {
                          await controller.deleteDiscount();
                        }
                      });
                      controller.fabKey.currentState?.toggle();
                    },
                    child: const Icon(MedusaIcons.trash)),
                const SizedBox(width: 12.0),
                FloatingActionButton(
                    heroTag: null,
                    backgroundColor: ColorManager.primary,
                    foregroundColor: Colors.white,
                    onPressed: () async {
                      controller.fabKey.currentState?.toggle();
                      await Get.toNamed(Routes.ADD_UPDATE_DISCOUNT, arguments: discount)?.then((value) async {
                        if (value is bool && value == true) {
                          await controller.loadDiscount();
                          DiscountsController.instance.pagingController.refresh();
                        }
                      });
                    },
                    child: const Icon(MedusaIcons.pencil_square_solid)),
              ],
            ),
        onLoading: const SizedBox.shrink(),
        onError: (_) => const SizedBox.shrink());
  }
}
