
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StockLocationsScreen extends StatelessWidget {
  const StockLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Locations'),
      ),
      body: const Center(
        child: Text('Stock Locations Screen'),
      ),
    );
  }
}
