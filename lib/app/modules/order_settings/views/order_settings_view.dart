import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/components/order_card.dart';
import 'package:medusa_admin/app/modules/orders_module/orders/controllers/orders_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/order_settings_controller.dart';

class OrderSettingsView extends StatelessWidget {
  const OrderSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final switchColor = GetPlatform.isIOS ? ColorManager.primary : null;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    return GetBuilder<OrderSettingsController>(builder: (controller) {
      final storageService = StorageService.instance;
      final orderSettings = StorageService.orderSettings;
      return Scaffold(
        appBar: AppBar(
          leading: AdaptiveBackButton(
            onPressed: () {
              OrdersController.instance.update();
              Get.back();
            },
          ),
          title: const Text('Order Settings'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 6.0),
              if (orderSettings.alternativeCard)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: orderSettings.padding),
                  child: AlternativeOrderCard(controller.order, onTap: () {}),
                ),
              if (!orderSettings.alternativeCard)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: orderSettings.padding),
                  child: OrderCard(controller.order, onTap: () {}),
                ),
              const SizedBox(height: 6.0),
              SettingsList(
                shrinkWrap: true,
                contentPadding: EdgeInsets.zero,
                lightTheme: SettingsThemeData(
                    settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
                    settingsSectionBackground: Theme.of(context).cardColor),
                darkTheme: SettingsThemeData(
                    settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
                    settingsSectionBackground: Theme.of(context).cardColor),
                sections: [
                  SettingsSection(tiles: [
                    SettingsTile.switchTile(
                      activeSwitchColor: switchColor,
                      title: const Text('Show detailed payment status'),
                      onPressed: (_) {},
                      initialValue: orderSettings.paymentStatusDot,
                      onToggle: (value) {
                        storageService.updateOrderSettings(orderSettings.copyWith(paymentStatusDot: value));
                        controller.update();
                      },
                    ),
                    SettingsTile.switchTile(
                      activeSwitchColor: switchColor,
                      title: const Text('Hide flag'),
                      onPressed: (_) {},
                      initialValue: orderSettings.hideFlag,
                      onToggle: (value) {
                        storageService.updateOrderSettings(orderSettings.copyWith(hideFlag: value));
                        controller.update();
                      },
                    ),
                    SettingsTile.switchTile(
                      activeSwitchColor: switchColor,
                      title: const Text('Include email with name'),
                      onPressed: (_) {},
                      initialValue: orderSettings.includeEmail,
                      onToggle: (value) {
                        storageService.updateOrderSettings(orderSettings.copyWith(includeEmail: value));
                        controller.update();
                      },
                    ),
                    SettingsTile.switchTile(
                      activeSwitchColor: switchColor,
                      title: const Text('Alternative card'),
                      onPressed: (_) {},
                      initialValue: orderSettings.alternativeCard,
                      onToggle: (value) {
                        storageService.updateOrderSettings(orderSettings.copyWith(alternativeCard: value));
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
                            Text(orderSettings.padding.toStringAsFixed(2), style: smallTextStyle),
                          ],
                        ),
                        Slider.adaptive(
                          value: orderSettings.padding,
                          onChanged: (val) {
                            storageService.updateOrderSettings(orderSettings.copyWith(padding: val));
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
      );
    });
  }
}
