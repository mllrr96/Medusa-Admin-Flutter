import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/products/product_details/components/product_details_components.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    const space = SizedBox(height: 12.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
        actions: [
          if (controller.state != null)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(controller.state!.status.name.capitalize ?? controller.state!.status.name,
                  style: smallTextStyle),
            ),
        ],
      ),
      body: SafeArea(
        child: controller.obx(
          (product) => ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            children: [
              ProductDetailsOverview(product: product!),
              space,
              ProductDetailsVariants(product: product),
              space,
              ProductDetailsAttributes(product: product),
              space,
              ProductDetailsThumbnail(product: product),
              space,
              ProductDetailsImages(product: product),
            ],
          ),
          onError: (e) => Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Error loading product'),
              if (GetPlatform.isIOS)
                CupertinoButton(child: const Text('Retry'), onPressed: () async => await controller.loadProduct()),
              if (GetPlatform.isAndroid)
                TextButton(child: const Text('Retry'), onPressed: () async => await controller.loadProduct())
            ],
          )),
          onLoading: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      ),
    );
  }
}
