import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../components/product_components.dart';
import '../controllers/add_update_product_controller.dart';

class AddUpdateProductView extends StatelessWidget {
  const AddUpdateProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 12.0);
    return GetBuilder<AddUpdateProductController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('New Product'),
              centerTitle: true,
              actions: [
                if (GetPlatform.isAndroid) TextButton(onPressed: () {}, child: const Text('Publish')),
                if (GetPlatform.isIOS) CupertinoButton(onPressed: () async => await controller.addProduct(), child: const Text('Publish')),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: [ProductGeneralInformation(), space, ProductOrganize(), space, ProductVariants()],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
