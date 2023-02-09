import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: SafeArea(
        child: controller.obx(
          (orders) => Column(
            children: [
              const Text('There are orders !'),
              CupertinoButton(child: Text('print'), onPressed: (){
                print(orders?.length);
              })
            ],
          ),
          onLoading: const Center(child: CircularProgressIndicator.adaptive()),
          onError: (e) => const Text('Error'),
          onEmpty: const Center(child: Text('Empty')),
        ),
      ),
    );
  }
}
