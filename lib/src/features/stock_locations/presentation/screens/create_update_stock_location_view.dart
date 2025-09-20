
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateUpdateStockLocationView extends StatelessWidget {
  const CreateUpdateStockLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Stock Location'),
      ),
      body: const Center(
        child: Text('Create Update Stock Location View'),
      ),
    );
  }
}
