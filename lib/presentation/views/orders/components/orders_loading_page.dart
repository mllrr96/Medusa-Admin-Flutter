import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/presentation/views/orders/components/order_card_shad.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        paymentStatus: PaymentStatus.partiallyRefunded,
        regionId: "",
        currencyCode: 'USD',
        customer: const Customer(
            firstName: 'Medusa', lastName: 'Admin', email: 'Medusa Js'),
        cart: Cart(createdAt: DateTime.now()));
    return Skeletonizer(
      enabled: true,
      child: Column(
          children: List.generate(
              20,
              (index) => index.isEven
                  ? ShadOrderCard(order, shimmer: true)
                  : const Gap(8.0))),
    );
  }
}
