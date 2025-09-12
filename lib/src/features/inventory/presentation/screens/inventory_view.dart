import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Inventory View'),
      ),
    );
  }
}
