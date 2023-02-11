import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/general_info.dart';

import '../controllers/add_update_product_controller.dart';

class AddUpdateProductView extends GetView<AddUpdateProductController> {
  const AddUpdateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Product'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          children: [
            GeneralInformation(),
          ],
        ),
      ),
    );
  }
}
