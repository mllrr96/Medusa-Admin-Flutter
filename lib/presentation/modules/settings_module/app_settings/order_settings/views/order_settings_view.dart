import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/settings_list_tile_extension.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/presentation/modules/orders_module/orders/components/order_card.dart';
import 'package:medusa_admin/presentation/modules/orders_module/orders/controllers/orders_controller.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import '../controllers/order_settings_controller.dart';

@RoutePage()
class OrderSettingsView extends StatelessWidget {
  const OrderSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderSettingsController>(
        init: OrderSettingsController(),
        builder: (controller) {
          final switchColor = GetPlatform.isIOS ? ColorManager.primary : null;
          final smallTextStyle = context.bodySmall;
          return PopScope(
            canPop: mapEquals(controller.orderPreference.toJson(),
                PreferenceService.orderPreference.toJson()),
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
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  MedusaSliverAppBar(
                    title: const Text('Order Settings'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            PreferenceService.instance
                                .updateOrderSettings(controller.orderPreference);
                            OrdersController.instance.update();
                            context.popRoute();
                          },
                          child: const Text('Save'))
                    ],
                  ),
                ],
                body: ListView(
                  children: [
                    // const SizedBox(height: 6.0),
                    if (controller.orderPreference.alternativeCard)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: controller.orderPreference.padding),
                        child: AlternativeOrderCard(controller.order,
                            onTap: () {},
                            orderPreference: controller.orderPreference),
                      ),
                    if (!controller.orderPreference.alternativeCard)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: controller.orderPreference.padding),
                        child: OrderCard(
                          controller.order,
                          onTap: () {},
                          orderPreference: controller.orderPreference,
                        ),
                      ),
                    const SizedBox(height: 6.0),
                    SettingsList(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      contentPadding: EdgeInsets.zero,
                      lightTheme: context.settingsListLightTheme,
                      darkTheme: context.settingsListDarkTheme,
                      sections: [
                        SettingsSection(tiles: [
                          SettingsTile.switchTile(
                            activeSwitchColor: switchColor,
                            title: const Text('Show detailed payment status'),
                            onPressed: (_) {},
                            initialValue:
                                controller.orderPreference.paymentStatusDot,
                            onToggle: (value) {
                              controller.orderPreference = controller
                                  .orderPreference
                                  .copyWith(paymentStatusDot: value);
                              // storageService.updateOrderSettings(orderSettings.copyWith(paymentStatusDot: value));
                              controller.update();
                            },
                          ),
                          SettingsTile.switchTile(
                            activeSwitchColor: switchColor,
                            title: const Text('Hide flag'),
                            onPressed: (_) {},
                            initialValue: controller.orderPreference.hideFlag,
                            onToggle: (value) {
                              controller.orderPreference = controller
                                  .orderPreference
                                  .copyWith(hideFlag: value);
                              controller.update();
                            },
                          ),
                          SettingsTile.switchTile(
                            activeSwitchColor: switchColor,
                            title: const Text('Include email with name'),
                            onPressed: (_) {},
                            initialValue: controller.orderPreference.includeEmail,
                            onToggle: (value) {
                              controller.orderPreference = controller
                                  .orderPreference
                                  .copyWith(includeEmail: value);
                              controller.update();
                            },
                          ),
                          SettingsTile.switchTile(
                            activeSwitchColor: switchColor,
                            title: const Text('Alternative card'),
                            onPressed: (_) {},
                            initialValue:
                                controller.orderPreference.alternativeCard,
                            onToggle: (value) {
                              controller.orderPreference = controller
                                  .orderPreference
                                  .copyWith(alternativeCard: value);
                              controller.update();
                            },
                          ),
                        ]),
                        CustomSettingsSection(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Padding', style: smallTextStyle),
                                  Text(
                                      controller.orderPreference.padding
                                          .toStringAsFixed(2),
                                      style: smallTextStyle),
                                ],
                              ),
                              Slider.adaptive(
                                value: controller.orderPreference.padding,
                                divisions: 16,
                                onChanged: (val) {
                                  controller.orderPreference = controller
                                      .orderPreference
                                      .copyWith(padding: val);
                                  controller.update();
                                },
                                min: 0.0,
                                max: 16.0,
                              ),
                            ],
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
