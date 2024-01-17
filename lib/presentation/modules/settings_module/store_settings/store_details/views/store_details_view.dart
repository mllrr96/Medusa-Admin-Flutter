import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/update_store_use_case.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';

import '../controllers/store_details_controller.dart';

@RoutePage()
class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return GetBuilder<StoreDetailsController>(
        init: StoreDetailsController(updateStoreUseCase: UpdateStoreUseCase.instance),
        builder: (controller) {
          return GestureDetector(
            onTap: () => context.unfocus(),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Store Details'),
                actions: [
                  TextButton(
                      child: const Text('Save'),
                      onPressed: () async => await controller.save(context)),
                ],
              ),
              body: SafeArea(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Manage your business details',
                          style: mediumTextStyle!.copyWith(color: lightWhite)),
                    ),
                    Form(
                      key: controller.keyFrom,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                          color: Theme.of(context)
                              .expansionTileTheme
                              .backgroundColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('General', style: largeTextStyle),
                            space,
                            LabeledTextField(
                              label: 'Store Name',
                              controller: controller.storeCtrl,
                              validator: (value) {
                                if (value != null &&
                                    value.removeAllWhitespace.isEmpty) {
                                  return "Store name can't be empty ";
                                }
                                return null;
                              },
                            ),
                            const Divider(),
                            Text('Advanced settings', style: largeTextStyle),
                            space,
                            LabeledTextField(
                              label: 'Swap link template',
                              controller: controller.swapLinkCtrl,
                              hintText: 'https://acme.inc/swap={swap_id}',
                              validator: (value) {
                                if (value != null &&
                                    value.removeAllWhitespace.isNotEmpty &&
                                    !value.isURL) {
                                  return "Invalid URL";
                                }
                                return null;
                              },
                            ),
                            LabeledTextField(
                              label: 'Draft order link template',
                              controller: controller.draftOrderCtrl,
                              hintText: 'https://acme.inc/payment={payment_id}',
                              validator: (value) {
                                if (value != null &&
                                    value.removeAllWhitespace.isNotEmpty &&
                                    !value.isURL) {
                                  return "Invalid URL";
                                }
                                return null;
                              },
                            ),
                            LabeledTextField(
                              label: 'Invite link template',
                              controller: controller.inviteLinkCtrl,
                              hintText:
                                  'https://acme.inc/invite?token={invite_token}',
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value != null &&
                                    value.removeAllWhitespace.isNotEmpty &&
                                    !value.isURL) {
                                  return "Invalid URL";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
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
