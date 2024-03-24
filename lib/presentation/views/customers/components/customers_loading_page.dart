import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'customer_list_tile.dart';

class CustomersLoadingPage extends StatelessWidget {
  const CustomersLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final customer = Customer(
      email: 'medusa@js.com',
      firstName: 'Medusa',
      lastName: 'Admin',
      id: '1',
      phone: '1234567890',
      orders: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: List.generate(
          10,
          (index) => CustomerListTile(customer, index: index, shimmer: true),
        ),
      ),
    );
  }
}
