import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InventoryDetailsView extends StatelessWidget {
  const InventoryDetailsView(this.id, {super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Details'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Inventory Details View'),
        ),
      ),
    );
  }
}
