import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customers_controller.dart';

class CustomersView extends GetView<CustomersController> {
  const CustomersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomersView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CustomersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
