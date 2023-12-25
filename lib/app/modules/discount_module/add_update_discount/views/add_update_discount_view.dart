import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import '../../../../data/models/store/index.dart';
import '../../../../data/repository/discount/discount_repo.dart';
import '../components/index.dart';
import '../controllers/add_update_discount_controller.dart';
import 'package:medusa_admin/core/utils/extension.dart';

@RoutePage()
class AddUpdateDiscountView extends StatelessWidget {
  const AddUpdateDiscountView({super.key, this.discount});
  final Discount? discount;
  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return GetBuilder<AddUpdateDiscountController>(
        init: AddUpdateDiscountController(
            discountRepo: DiscountRepo(), discount: discount),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              if (controller.updateMode && !controller.sameDiscount()) {
                return await showOkCancelAlertDialog(
                  context: context,
                  title: 'Discard changes',
                  message: 'Are you sure you want to discard changes?',
                  okLabel: 'Discard',
                  isDestructiveAction: true,
                ).then((result) => result == OkCancelResult.ok ? true : false);
              } else {
                return true;
              }
            },
            child: GestureDetector(
              onTap: () => context.unfocus(),
              child: Scaffold(
                appBar: AppBar(
                  leading: AdaptiveCloseButton(onPressed: () async {
                    if (controller.updateMode && !controller.sameDiscount()) {
                      await showOkCancelAlertDialog(
                        context: context,
                        title: 'Discard changes',
                        message: 'Are you sure you want to discard changes?',
                        okLabel: 'Discard',
                        isDestructiveAction: true,
                      ).then((result) {
                        if (result == OkCancelResult.ok) {
                          context.popRoute();
                        }
                      });
                    } else {
                      context.popRoute();
                    }
                  }),
                  title: controller.updateMode
                      ? const Text('Update discount')
                      : const Text('Create new discount'),
                  actions: [
                    AdaptiveButton(
                        onPressed: () async => controller.updateMode
                            ? await controller.updateDiscount(context)
                            : await controller.createDiscount(context),
                        child: controller.updateMode
                            ? const Text('Update')
                            : const Text('Create')),
                  ],
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 10.0),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            if (!controller.updateMode)
                              const DiscountTypeExpansionTile(),
                            if (!controller.updateMode) space,
                            const GeneralExpansionTile(),
                            space,
                            const ConfigurationExpansionTile(),
                            space,
                            if (!controller.updateMode)
                              const ConditionExpansionTile(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
