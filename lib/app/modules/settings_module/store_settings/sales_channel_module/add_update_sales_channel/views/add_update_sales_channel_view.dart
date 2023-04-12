import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_filled_button.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';

import '../controllers/add_update_sales_channel_controller.dart';

class AddUpdateSalesChannelView extends GetView<AddUpdateSalesChannelController> {
  const AddUpdateSalesChannelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddUpdateSalesChannelController>(
      assignId: true,
      builder: (controller) {
        final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;
        return Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: controller.updateMode ? const Text('Update sales channel') : const Text('Create new sales channel'),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            padding: EdgeInsets.only(bottom: bottomViewPadding, top: bottomViewPadding / 2),
            child: AdaptiveFilledButton(
              buttonColor: controller.disabled ? Colors.blueGrey : null,
              onPressed: () async =>
                  controller.updateMode ? await controller.updateChannel() : await controller.createChannel(),
              child: controller.updateMode
                  ? const Text('Update Channel')
                  : controller.disabled
                      ? const Text('Save as draft')
                      : const Text('Publish Channel'),
            ),
          ),
          body: SafeArea(
            child: Form(
              key: controller.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                children: [
                  CustomExpansionTile(
                    initiallyExpanded: true,
                    label: 'General info',
                    children: [
                      LabeledTextField(
                        label: 'Title',
                        controller: controller.titleCtrl,
                        hintText: 'Website, App, Amazon, physical store POS, facebook, product feed',
                        required: !controller.updateMode,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Field is required';
                          }

                          return null;
                        },
                      ),
                      LabeledTextField(
                        label: 'Description',
                        controller: controller.descriptionCtrl,
                        hintText: 'Available products at our website, app ...',
                      ),
                      CheckboxListTile(
                        value: controller.disabled,
                        onChanged: (val) {
                          if (val == null) return;
                          controller.disabled = val;
                          controller.update();
                        },
                        title: const Text('Disabled'),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
