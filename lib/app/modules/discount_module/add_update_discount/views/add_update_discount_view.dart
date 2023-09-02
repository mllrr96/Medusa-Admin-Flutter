import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import '../components/index.dart';
import '../controllers/add_update_discount_controller.dart';

class AddUpdateDiscountView extends GetView<AddUpdateDiscountController> {
  const AddUpdateDiscountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
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
        onTap: () => FocusScope.of(context).unfocus(),
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
                ).then((result) => result == OkCancelResult.ok ? Get.back() : null);
              } else {
                Get.back();
              }
            }),
            title: controller.updateMode ? const Text('Update discount') : const Text('Create new discount'),
            actions: [
              AdaptiveButton(
                  onPressed: () async => controller.updateMode
                      ? await controller.updateDiscount(context)
                      : await controller.createDiscount(context),
                  child: controller.updateMode ? const Text('Update') : const Text('Create')),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      if (!controller.updateMode) DiscountTypeExpansionTile(context),
                      if (!controller.updateMode) space,
                      GeneralExpansionTile(context),
                      space,
                      ConfigurationExpansionTile(context),
                      space,
                      if (!controller.updateMode) ConditionExpansionTile(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
