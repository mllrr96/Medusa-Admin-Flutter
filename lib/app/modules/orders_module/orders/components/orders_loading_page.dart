import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../data/service/storage_service.dart';
import 'order_card.dart';

class OrdersLoadingPage extends StatelessWidget {
  const OrdersLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final order = Order(
        id: '1',
        total: 12345,
        shippingAddress: const Address(countryCode: 'USD'),
        customerId: '',
        email: "medusa@js.com",
        regionId: "",
        currencyCode: 'USD',
        customer: const Customer(
            firstName: 'Medusa', lastName: 'Admin', email: 'Medusa Js'),
        cart: Cart(createdAt: DateTime.now()));
    final orderSettings = StorageService.orderSettings;

    final widget = orderSettings.alternativeCard
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
