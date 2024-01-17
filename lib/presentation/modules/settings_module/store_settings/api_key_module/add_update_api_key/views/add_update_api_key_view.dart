import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/api_key_use_case.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import '../controllers/add_update_api_key_controller.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

@RoutePage()
class AddUpdateApiKeyView extends StatelessWidget {
  const AddUpdateApiKeyView({super.key, this.publishableApiKey});
  final PublishableApiKey? publishableApiKey;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    return GetBuilder<AddUpdateApiKeyController>(
        init: AddUpdateApiKeyController(
             publishableApiKey: publishableApiKey, apiKeyUseCase: ApiKeyUseCase.instance),
        builder: (controller) {
          return GestureDetector(
            onTap: () => context.unfocus(),
            child: Scaffold(
              appBar: AppBar(
                title: controller.updateMode
                    ? const Text('Update Api Key')
                    : const Text('Create New Api Key'),
                actions: [
                  TextButton(
                    onPressed: () async => await controller.publish(context),
                    child: const Text('Publish'),
                  ),
                ],
              ),
              body: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  children: [
                    Form(
                      key: controller.keyForm,
                      child: FlexExpansionTile(
                        title: const Text('General Information'),
                        initiallyExpanded: true,
                       child: Column(
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
                               if (val == null ||
                                   val.removeAllWhitespace.isEmpty) {
                                 return 'Field is required';
                               }
                               return null;
                             },
                           )
                         ],
                       ),
                      ),
                    ),
                    space,
                    FlexExpansionTile(
                      title: const Text('Sales channels'),
                      child: Column(
                        children: [
                          Text(
                            'Connect as many sales channels to your API key as you need.',
                            style: smallTextStyle?.copyWith(color: lightWhite),
                          ),
                          space,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
