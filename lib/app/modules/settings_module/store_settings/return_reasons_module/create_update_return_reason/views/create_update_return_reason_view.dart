import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/return_reason/return_reason_repo.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../components/custom_text_field.dart';
import '../controllers/create_update_return_reason_controller.dart';

@RoutePage()
class CreateUpdateReturnReasonView extends StatelessWidget {
  const CreateUpdateReturnReasonView({super.key, this.returnReason});
  final ReturnReason? returnReason;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateUpdateReturnReasonController>(
        init: CreateUpdateReturnReasonController(
            returnReasonRepo: ReturnReasonRepo(), returnReason: returnReason),
        builder: (controller) {
          return GestureDetector(
            onTap: () => context.unfocus(),
            child: Scaffold(
              appBar: AppBar(
                leading: const AdaptiveCloseButton(),
                title: controller.updateMode
                    ? const Text('Update Return Reason')
                    : const Text('Create Return Reason'),
                actions: [
                  AdaptiveButton(
                    onPressed: () async => await controller.save(context),
                    child: controller.updateMode
                        ? const Text('Update')
                        : const Text('Create'),
                  )
                ],
              ),
              body: SafeArea(
                child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    children: [
                      Form(
                        key: controller.formKey,
                        child: Container(
                          decoration: BoxDecoration(
                              color: context.theme.cardColor,
                              borderRadius: const BorderRadius.all(Radius.circular(12.0))),
                          padding:  const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LabeledTextField(
                                label: 'Label',
                                controller: controller.labelCtrl,
                                required: true,
                                hintText: 'Wrong Size',
                                validator: (val) {
                                  if (val == null ||
                                      val.removeAllWhitespace.isEmpty) {
                                    return 'Field is required';
                                  }
                                  return null;
                                },
                              ),
                              LabeledTextField(
                                label: 'Value',
                                controller: controller.valueCtrl,
                                required: !controller.updateMode,
                                hintText: 'wrong_size',
                                enabled: !controller.updateMode,
                                style: controller.updateMode
                                    ? context.bodySmall
                                    ?.copyWith(color: Colors.grey)
                                    : null,
                                decoration: controller.updateMode
                                    ? const InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                )
                                    : null,
                                validator: (val) {
                                  if (controller.updateMode) {
                                    return null;
                                  }
                                  if (val == null ||
                                      val.removeAllWhitespace.isEmpty) {
                                    return 'Field is required';
                                  }
                                  return null;
                                },
                              ),
                              LabeledTextField(
                                label: 'Description',
                                controller: controller.descriptionCtrl,
                                hintText: 'Customer received the wrong size',
                                maxLines: null,
                                textInputAction: TextInputAction.newline,
                              ),
                            ],
                          ),
                        )
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
