import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import '../controllers/transfer_order_controller.dart';

class TransferOrderView extends GetView<TransferOrderController> {
  const TransferOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveCloseButton(),
        title: const Text('TransferOrderView'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'TransferOrderView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
