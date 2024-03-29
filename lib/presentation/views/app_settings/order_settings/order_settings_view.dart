import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:medusa_admin/core/extension/settings_list_tile_extension.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/data/models/order_preference.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/presentation/views/orders/components/order_card.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

@RoutePage()
class OrderSettingsView extends StatefulWidget {
  const OrderSettingsView({super.key});

  @override
  State<OrderSettingsView> createState() => _OrderSettingsViewState();
}

class _OrderSettingsViewState extends State<OrderSettingsView> {
  late OrderPreference orderPreference;
  Order order = Order(
    customerId: '',
    email: 'Medusa@js.com',
    regionId: '',
    currencyCode: 'usd',
    customer: const Customer(
        email: 'Medusa@js.com', firstName: 'Medusa', lastName: 'Js'),
    total: 12345,
    shippingAddress: const Address(countryCode: 'us'),
    cart: Cart(
      createdAt: DateTime.now(),
    ),
    currency: const Currency(
      name: 'US Dollars',
      symbol: '\$',
      symbolNative: '\$',
      code: 'us',
    ),
    fulfillmentStatus: FulfillmentStatus.notFulfilled,
    paymentStatus: PaymentStatus.captured,
    displayId: 69,
  );

  @override
  void initState() {
    orderPreference = PreferenceService.orderPreference;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final switchColor = Platform.isIOS ? ColorManager.primary : null;
    final smallTextStyle = context.bodySmall;
    return PopScope(
      canPop: mapEquals(
          orderPreference.toJson(), PreferenceService.orderPreference.toJson()),
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
                    onPressed: mapEquals(orderPreference.toJson(),
                            PreferenceService.orderPreference.toJson())
                        ? null
                        : () {
                            PreferenceService.instance
                                .updateOrderSettings(orderPreference);
                            // Ordersinstance.update();
                            context.router.popForced();
                          },
                    child: const Text('Save'))
              ],
            ),
          ],
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            children: [
              // const SizedBox(height: 6.0),
              if (orderPreference.alternativeCard)
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: orderPreference.padding),
                  child: AlternativeOrderCard(order,
                      onTap: () {}, orderPreference: orderPreference),
                ),
              if (!orderPreference.alternativeCard)
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: orderPreference.padding),
                  child: OrderCard(
                    order,
                    onTap: () {},
                    orderPreference: orderPreference,
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
                      initialValue: orderPreference.paymentStatusDot,
                      onToggle: (value) {
                        orderPreference =
                            orderPreference.copyWith(paymentStatusDot: value);
                        // storageService.updateOrderSettings(orderSettings.copyWith(paymentStatusDot: value));
                        setState(() {});
                      },
                    ),
                    SettingsTile.switchTile(
                      activeSwitchColor: switchColor,
                      title: const Text('Hide flag'),
                      onPressed: (_) {},
                      initialValue: orderPreference.hideFlag,
                      onToggle: (value) {
                        orderPreference =
                            orderPreference.copyWith(hideFlag: value);
                        setState(() {});
                      },
                    ),
                    SettingsTile.switchTile(
                      activeSwitchColor: switchColor,
                      title: const Text('Include email with name'),
                      onPressed: (_) {},
                      initialValue: orderPreference.includeEmail,
                      onToggle: (value) {
                        orderPreference =
                            orderPreference.copyWith(includeEmail: value);
                        setState(() {});
                      },
                    ),
                    SettingsTile.switchTile(
                      activeSwitchColor: switchColor,
                      title: const Text('Alternative card'),
                      onPressed: (_) {},
                      initialValue: orderPreference.alternativeCard,
                      onToggle: (value) {
                        orderPreference =
                            orderPreference.copyWith(alternativeCard: value);
                        setState(() {});
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
                            Text(orderPreference.padding.toStringAsFixed(2),
                                style: smallTextStyle),
                          ],
                        ),
                        Slider.adaptive(
                          value: orderPreference.padding,
                          divisions: 16,
                          onChanged: (val) {
                            orderPreference =
                                orderPreference.copyWith(padding: val);
                            setState(() {});
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
  }
}
