import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'order_card.dart';

class OrdersLoadingPage extends StatelessWidget {
  const OrdersLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final order = AdminOrder(
    //     id: '1',
    //     total: 12345,
    //     shippingAddress:  AdminOrderAddress(countryCode: 'USD'),
    //     customerId: '',
    //     email: "medusa@js.com",
    //     regionId: "",
    //     currencyCode: 'USD',
    //     customer:  AdminCustomer(
    //         firstName: 'Medusa', lastName: 'Admin', email: 'Medusa Js', hasAccount: true),
    //     );
    final order =  AdminOrder((b) => b
      ..id = '1'
      ..total = 12345
      ..shippingAddress.update((b) => b..countryCode = 'USD')
      ..customerId = ''
      ..email = "medusa@js.com" .. regionId = "" .. currencyCode = 'USD' ..customer.update((b) => b
        ..firstName = 'Medusa'
        ..lastName = 'Admin'
        ..email = 'Medusa Js'
        ..hasAccount = true));
    final orderPreference = PreferenceService.orderPreference;

    final widget = orderPreference.alternativeCard
        ? AlternativeOrderCard(order, shimmer: true)
        : OrderCard(order, shimmer: true);

    return Skeletonizer(
      enabled: true,
      child: Column(
          children: List.generate(
              20,
              (index) => index.isEven
                  ? widget
                  : const Gap(8.0))),
    );
  }
}
