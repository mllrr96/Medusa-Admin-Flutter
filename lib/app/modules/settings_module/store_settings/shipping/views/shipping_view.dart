import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/adaptive_back_button.dart';
import '../controllers/shipping_controller.dart';

@RoutePage()
class ShippingView extends GetView<ShippingController> {
  const ShippingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
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
