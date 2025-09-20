
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@RoutePage()
class StockLocationDetailsScreen extends StatelessWidget {
  const StockLocationDetailsScreen(this.stockLocation, {super.key});
  final StockLocation stockLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockLocation.name),
      ),
      body: const Center(
        child: Text('Stock Location Details Screen'),
      ),
    );
  }
}
