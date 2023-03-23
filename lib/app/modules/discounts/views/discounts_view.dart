import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/discounts_controller.dart';

class DiscountsView extends GetView<DiscountsController> {
  const DiscountsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiscountsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DiscountsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
