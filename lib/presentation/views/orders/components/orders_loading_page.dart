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
    final order = Order(
      displayId: 123,
      customerId: '',
      email: 'Medusa@js.com',
      regionId: '',
      currencyCode: 'USD',
      id: '',
      version: 0,
      status: OrderStatus.canceled,
    );


    final loadingWidget = PreferenceService.orderPreference.alternativeCard
        ? AlternativeOrderCard(order, shimmer: true)
        : OrderCard(order, shimmer: true);

    return Skeletonizer(
      enabled: true,
      child: Column(
          children: List.generate(
              20,
              (index) => index.isEven
                  ? loadingWidget
                  : const Gap(8.0))),
    );
  }
}
