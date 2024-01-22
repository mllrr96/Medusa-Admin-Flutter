import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/domain/use_case/group/update_group_use_case.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/metadata_card.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../controllers/create_update_group_controller.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class CreateUpdateGroupView extends GetView<CreateUpdateGroupController> {
  const CreateUpdateGroupView({super.key,this.customerGroup});
  final CustomerGroup? customerGroup;

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    final largeTextStyle = context.bodyLarge;
    return GetBuilder<CreateUpdateGroupController>(
      init: CreateUpdateGroupController(updateGroupUseCase: UpdateGroupUseCase.instance, customerGroup: customerGroup),
      builder: (controller) {
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const CloseButton(),
              title:
                  controller.updateMode ? const Text('Update Customer Group') : const Text('Create New Customer Group'),
              actions: [
                TextButton(
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
                controller: controller.scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      color: context.theme.cardColor,
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LabeledTextField(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Metadata', style: largeTextStyle),
                              TextButton(
                                child: const Row(mainAxisSize: MainAxisSize.min, children: [
                                  Icon(Icons.add),
                                  Text('Add Metadata'),
                                ]),
                                onPressed: () async {
                                  controller.listKey.currentState?.insertItem(controller.metadataTextCtrl.length,
                                      duration: const Duration(milliseconds: 200));

                                  controller.metadataTextCtrl.add(
                                      MetadataTextCtrl(key: TextEditingController(), value: TextEditingController()));
                                  controller.update();
                                  // await Future.delayed(const Duration(milliseconds: 240)).then((value) async {
                                  //   await controller.scrollController.animateTo(
                                  //       controller.scrollController.position.maxScrollExtent,
                                  //       duration: const Duration(milliseconds: 300),
                                  //       curve: Curves.fastOutSlowIn);
                                  // });
                                },
                              ),
                            ],
                          ),
                          space,
                          if (controller.metadataTextCtrl.isNotEmpty)
                            AnimatedList(
                                reverse: true,
                                key: controller.listKey,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                initialItemCount: controller.metadataTextCtrl.length,
                                itemBuilder: (context, index, animation) {
                                  final metaData = controller.metadataTextCtrl[index];
                                  return SizeTransition(
                                    key: ValueKey(index),
                                    axis: Axis.vertical,
                                    sizeFactor: animation,
                                    child: MetadataCard(
                                      keyCtrl: metaData.key,
                                      valueCtrl: metaData.value,
                                      onDelete: () {
                                        controller.metadataTextCtrl.removeAt(index);
                                        controller.listKey.currentState?.removeItem(
                                            index,
                                            (_, animation) => SizeTransition(
                                                  key: ValueKey(index),
                                                  axis: Axis.vertical,
                                                  sizeFactor: animation,
                                                  child: MetadataCard(
                                                    key: ValueKey(index),
                                                    keyCtrl: metaData.key,
                                                    valueCtrl: metaData.value,
                                                  ),
                                                ),
                                            duration: const Duration(milliseconds: 200));
                                        controller.update();
                                      },
                                    ),
                                  );
                                }),
                        ],
                      ),
                    ),
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
