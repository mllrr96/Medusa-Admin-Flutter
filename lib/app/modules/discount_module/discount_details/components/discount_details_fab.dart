import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/discount.dart';
import 'package:medusa_admin/app/modules/discount_module/discount_details/controllers/discount_details_controller.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/medusa_icons_icons.dart';
import '../../discounts/controllers/discounts_controller.dart';

class DiscountDetailsFab extends GetView<DiscountDetailsController> {
  const DiscountDetailsFab({super.key, this.expandableStyle = true});
  final bool expandableStyle;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    onDeleteTap() async {
      await showOkCancelAlertDialog(
              context: context,
              title: 'Delete Promotion',
              message: 'Are you sure you want to delete this promotion?',
              okLabel: 'Yes, delete',
              cancelLabel: 'Cancel',
              isDestructiveAction: true)
          .then((value) async {
        if (value == OkCancelResult.ok) {
          await controller.deleteDiscount(context);
        }
      });
    }

    onUpdateTap(Discount discount) async {
      await context.pushRoute(AddUpdateDiscountRoute(discount: discount)).then((value) async {
        if (value is bool && value == true) {
          await controller.loadDiscount();
          DiscountsController.instance.pagingController.refresh();
        }
      });
    }

    if (expandableStyle) {
      const emptySpeedDial = SpeedDial(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        animatedIcon: AnimatedIcons.menu_close,
      );

      return controller.obx(
          (discount) => SpeedDial(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                animatedIcon: AnimatedIcons.menu_close,
                spacing: 10,
                children: [
                  SpeedDialChild(
                    child: const Icon(MedusaIcons.trash),
                    label: 'Delete Discount',
                    backgroundColor: Colors.red,
                    labelBackgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    labelStyle: smallTextStyle?.copyWith(color: Colors.white),
                    onTap: onDeleteTap,
                    onLongPress: () {},
                  ),
                  SpeedDialChild(
                    child: const Icon(MedusaIcons.pencil_square_solid),
                    label: 'Update Discount',
                    labelStyle: smallTextStyle,
                    onTap: () async => await onUpdateTap(discount!),
                    onLongPress: () {},
                  ),
                ],
              ),
          onLoading: emptySpeedDial,
          onError: (_) => emptySpeedDial);
    }
    return controller.obx(
        (discount) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    onPressed: onDeleteTap,
                    child: const Icon(MedusaIcons.trash)),
                const SizedBox(width: 12.0),
                FloatingActionButton(
                    heroTag: null,
                    backgroundColor: ColorManager.primary,
                    foregroundColor: Colors.white,
                    onPressed: () async => await onUpdateTap(discount!),
                    child: const Icon(MedusaIcons.pencil_square_solid)),
              ],
            ),
        onLoading: const SizedBox.shrink(),
        onError: (_) => const SizedBox.shrink());
  }
}
