import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/order_card.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/controllers/orders_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

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
      return WillPopScope(
        onWillPop: () async {
          if (!mapEquals(controller.orderSettings.toJson(), StorageService.orderSettings.toJson())) {
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
        child: Scaffold(
          appBar: AppBar(
            leading: const AdaptiveBackButton(),
            title: const Text('Order Settings'),
            actions: [
              AdaptiveButton(
                  onPressed: () {
                    StorageService.instance.updateOrderSettings(controller.orderSettings);
                    OrdersController.instance.update();
                    context.popRoute();
                  },
                  child: const Text('Save'))
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 6.0),
                if (controller.orderSettings.alternativeCard)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: controller.orderSettings.padding),
                    child: AlternativeOrderCard(controller.order, onTap: () {}, orderSettings: controller.orderSettings),
                  ),
                if (!controller.orderSettings.alternativeCard)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: controller.orderSettings.padding),
                    child: OrderCard(controller.order, onTap: () {}, orderSettings: controller.orderSettings,),
                  ),
                const SizedBox(height: 6.0),
                SettingsList(
                  shrinkWrap: true,
                  contentPadding: EdgeInsets.zero,
                  lightTheme: context.settingsListLightTheme,
                  darkTheme: context.settingsListDarkTheme,
                  sections: [
                    SettingsSection(tiles: [
                      SettingsTile.switchTile(
                        activeSwitchColor: switchColor,
                        title: const Text('Show detailed payment status'),
                        onPressed: (_) {},
                        initialValue: controller.orderSettings.paymentStatusDot,
                        onToggle: (value) {
                          controller.orderSettings = controller.orderSettings.copyWith(paymentStatusDot: value);
                          // storageService.updateOrderSettings(orderSettings.copyWith(paymentStatusDot: value));
                          controller.update();
                        },
                      ),
                      SettingsTile.switchTile(
                        activeSwitchColor: switchColor,
                        title: const Text('Hide flag'),
                        onPressed: (_) {},
                        initialValue: controller.orderSettings.hideFlag,
                        onToggle: (value) {
                          controller.orderSettings = controller.orderSettings.copyWith(hideFlag: value);
                          controller.update();
                        },
                      ),
                      SettingsTile.switchTile(
                        activeSwitchColor: switchColor,
                        title: const Text('Include email with name'),
                        onPressed: (_) {},
                        initialValue: controller.orderSettings.includeEmail,
                        onToggle: (value) {
                          controller.orderSettings = controller.orderSettings.copyWith(includeEmail: value);
                          controller.update();
                        },
                      ),
                      SettingsTile.switchTile(
                        activeSwitchColor: switchColor,
                        title: const Text('Alternative card'),
                        onPressed: (_) {},
                        initialValue: controller.orderSettings.alternativeCard,
                        onToggle: (value) {
                          controller.orderSettings = controller.orderSettings.copyWith(alternativeCard: value);
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Padding', style: smallTextStyle),
                              Text(controller.orderSettings.padding.toStringAsFixed(2), style: smallTextStyle),
                            ],
                          ),
                          Slider.adaptive(
                            value: controller.orderSettings.padding,
                            divisions: 16,
                            onChanged: (val) {
                              controller.orderSettings = controller.orderSettings.copyWith(padding: val);
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
