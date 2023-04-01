import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';

import '../../../components/adaptive_button.dart';
import '../controllers/create_update_group_controller.dart';

class CreateUpdateGroupView extends GetView<CreateUpdateGroupController> {
  const CreateUpdateGroupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: controller.updateMode ? const Text('Update Customer Group') : const Text('Create New Customer Group'),
          actions: [
            AdaptiveButton(
                onPressed: () async {
                  controller.updateMode
                      ? await controller.updateCustomerGroup(context)
                      : await controller.createCustomerGroup(context);
                },
                child: controller.updateMode ? const Text('Update') : const Text('Create'))
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  color: Theme.of(context).expansionTileTheme.backgroundColor,
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        label: 'Title',
                        required: true,
                        controller: controller.groupTitleCtrl,
                        hintText: 'Customer Group Title',
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Group title is required';
                          }
                          return null;
                        },
                      ),
                      space,
                      Row(
                        children: [
                          Text('Metadata', style: largeTextStyle),
                        ],
                      ),
                      space,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                      label: 'Key', controller: TextEditingController(), hintText: 'Some key'),
                                ),
                                AdaptiveIcon(
                                    onPressed: () {}, icon: const Icon(Icons.delete_forever, color: Colors.red)),
                              ],
                            ),
                            CustomTextField(
                                label: 'Value', controller: TextEditingController(), hintText: 'Some value'),
                          ],
                        ),
                      ),
                      AdaptiveButton(
                          child: Row(mainAxisSize: MainAxisSize.min, children: const [
                            Icon(Icons.add),
                            Text('Add Metadata'),
                          ]),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
