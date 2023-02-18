import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_details_controller.dart';

class CustomerDetailsView extends GetView<CustomerDetailsController> {
  const CustomerDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Details'), centerTitle: true),
      body: SafeArea(
          child: controller.obx(
        (customer) => Text(customer!.email),
        onError: (e) => const Center(child: Text('Error loading customer details')),
        onLoading: const Center(child: CircularProgressIndicator.adaptive()),
      )),
    );
  }
}
