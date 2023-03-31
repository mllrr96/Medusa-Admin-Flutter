import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/products_module/products/views/products_view.dart';
import 'package:medusa_admin/app/modules/select_products/controllers/select_products_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

class ChooseItemsView extends StatelessWidget {
  const ChooseItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseItemsController>(
      init: ChooseItemsController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (controller.selectedProducts.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.selectedProducts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final productVariant = controller.selectedProducts[index];
                        return ListTile(
                          title: Text(productVariant.title ?? ''),
                        );
                      }),
                ),
              Row(
                children: [
                  AdaptiveButton(
                      onPressed: () async {
                        final result = await Get.toNamed(Routes.SELECT_PRODUCTS,
                            arguments: SelectProductsReq(selectedProducts: controller.selectedProducts));
                        if (result is SelectProductsRes) {
                          controller.selectedProducts = result.selectedProducts ?? [];
                          controller.update();
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Platform.isIOS ? CupertinoIcons.add : Icons.add),
                          const Text('Add Existing'),
                        ],
                      )),
                  AdaptiveButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Platform.isIOS ? CupertinoIcons.add : Icons.add),
                          const Text('Add Custom'),
                        ],
                      )),
                ],
              )
            ],
          )),
        );
      },
    );
  }
}

class ChooseItemsController extends GetxController {
  var selectedProducts = <ProductVariant>[];
}
