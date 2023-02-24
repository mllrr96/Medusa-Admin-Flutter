import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/product_components.dart';

import '../controllers/create_collection_controller.dart';

class CreateCollectionView extends GetView<CreateCollectionController> {
  const CreateCollectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Collection'),
        centerTitle: true,
        actions: [TextButton(onPressed: () async => await controller.publish(), child: const Text('Publish'))],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            color: Theme.of(context).expansionTileTheme.backgroundColor,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text('Details', style: largeTextStyle),
                  ],
                ),
                // Text('Add Collection', style: Theme.of(context).textTheme.bodyLarge),
                Text('To create a collection, all you need is a title and a handle.',
                    style: smallTextStyle!.copyWith(color: lightWhite)),
                space,
                ProductTextField(
                  label: 'Title',
                  controller: controller.titleCtrl,
                  required: true,
                  hintText: 'Sunglasses',
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Field required';
                    }
                    return null;
                  },
                ),
                ProductTextField(label: 'Handle', controller: controller.handleCtrl, hintText: '/sunglasses'),
                Row(
                  children: [
                    Text('Metadata', style: largeTextStyle),
                  ],
                ),
                space,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever, color: Colors.red)),
                      ProductTextField(label: 'Key', controller: TextEditingController(), hintText: 'Some key'),
                      ProductTextField(label: 'Value', controller: TextEditingController(), hintText: 'Some value'),
                    ],
                  ),
                ),
                AdaptiveButton(
                    child: Row(mainAxisSize: MainAxisSize.min, children: const [
                      Icon(Icons.add),
                      Text('Add Metadata'),
                    ]),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
