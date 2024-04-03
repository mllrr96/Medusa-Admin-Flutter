import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ShippingView extends StatelessWidget {
  const ShippingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShippingView'),
      ),
      body: const Center(
        child: Text(
          'ShippingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
