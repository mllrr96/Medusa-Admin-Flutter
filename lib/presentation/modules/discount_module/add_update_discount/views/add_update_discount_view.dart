import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/domain/use_case/discount/update_discount_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../components/index.dart';
import '../controllers/add_update_discount_controller.dart';

@RoutePage()
class AddUpdateDiscountView extends StatelessWidget {
  const AddUpdateDiscountView({super.key, this.discount});
  final Discount? discount;
  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return GetBuilder<AddUpdateDiscountController>(
      init: AddUpdateDiscountController(
          updateDiscountUseCase: UpdateDiscountUseCase.instance, discount: discount),
      builder: (controller) {
        return PopScope(
          canPop: !controller.updateMode || (controller.updateMode && controller.sameDiscount()),
          onPopInvoked: (val) async {
            if (val) return;
            await showOkCancelAlertDialog(
              context: context,
              title: 'Discard changes',
              message: 'Are you sure you want to discard changes?',
              okLabel: 'Discard',
              isDestructiveAction: true,
            ).then((result) {
              if (result == OkCancelResult.ok) {
                context.router.popForced();
              }
            });
          },
          child: GestureDetector(
            onTap: () => context.unfocus(),
            child: Scaffold(
              appBar: AppBar(
                systemOverlayStyle: context.defaultSystemUiOverlayStyle,
                leading: const CloseButton(),
                title: controller.updateMode
                    ? const Text('Update discount')
                    : const Text('Create new discount'),
                actions: [
                  TextButton(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    child: Column(
                      children: [
                        if (!controller.updateMode)
                          const Column(
                            children: [
                              DiscountTypeExpansionTile(),
                              space,
                            ],
                          ),
                        Form(
                            key: controller.generalFormKey,
                            child: const GeneralExpansionTile()),
                        space,
                        Form(
                            key: controller.configFormKey,
                            child: const ConfigurationExpansionTile()),
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
        );
      },
    );
  }
}
