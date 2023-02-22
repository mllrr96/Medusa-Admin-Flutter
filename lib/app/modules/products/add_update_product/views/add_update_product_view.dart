import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../core/utils/enums.dart';
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
              title: controller.updateMode ? const Text('Update Product') : const Text('New Product'),
              centerTitle: true,
              actions: [
                if (GetPlatform.isAndroid)
                  TextButton(
                      onPressed: () async => controller.updateMode
                          ? await controller.updateProduct(context)
                          : await controller.addProduct(),
                      child: controller.updateMode ? const Text('Save') : const Text('Publish')),
                if (GetPlatform.isIOS)
                  CupertinoButton(
                      onPressed: () async => controller.updateMode
                          ? await controller.updateProduct(context)
                          : await controller.addProduct(),
                      child: controller.updateMode ? const Text('Save') : const Text('Publish')),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: buildComponents(controller),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildComponents(AddUpdateProductController controller) {
    const space = SizedBox(height: 12.0);
    if (!controller.updateMode) {
      return [const ProductGeneralInformation(), space, const ProductOrganize(), space, const ProductVariants()];
    }

    switch (controller.productComponents) {
      case ProductComponents.generalInfo:
        return [const ProductGeneralInformation(editMode: true)];
      case ProductComponents.salesChannel:
        return [ProductGeneralInformation()];

      case ProductComponents.addVariant:
        return [ProductGeneralInformation()];

      case ProductComponents.editVariants:
        return [ProductGeneralInformation()];

      case ProductComponents.editOptions:
        return [ProductGeneralInformation()];

      case ProductComponents.editAttributes:
        return [ProductGeneralInformation()];

      case ProductComponents.editThumbnail:
        return [ProductGeneralInformation()];

      case ProductComponents.editMedia:
        return [ProductGeneralInformation()];
    }
  }
}
