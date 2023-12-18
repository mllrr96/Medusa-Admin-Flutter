import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../controllers/add_update_api_key_controller.dart';

@RoutePage()
class AddUpdateApiKeyView extends GetView<AddUpdateApiKeyController> {
  const AddUpdateApiKeyView({super.key});
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveBackButton(),
          title: controller.updateMode ? const Text('Update Api Key') : const Text('Create New Api Key'),
          actions: [
            AdaptiveButton(
              onPressed: () async => await controller.publish(),
              child: const Text('Publish'),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            children: [
              Form(
                key: controller.keyForm,
                child: CustomExpansionTile(
                  label: 'General Information',
                  children: [
                    Text(
                      'Create and manage API keys. Right now this is only related to sales channels.',
                      style: smallTextStyle?.copyWith(color: lightWhite),
                    ),
                    space,
                    LabeledTextField(
                      label: 'Title',
                      controller: controller.titleCtrl,
                      hintText: 'Name your key',
                      required: true,
                      validator: (val) {
                        if (val == null || val.removeAllWhitespace.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              space,
              CustomExpansionTile(
                label: 'Sales channels',
                children: [
                  Text(
                    'Connect as many sales channels to your API key as you need.',
                    style: smallTextStyle?.copyWith(color: lightWhite),
                  ),
                  space,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
