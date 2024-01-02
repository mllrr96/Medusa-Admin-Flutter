import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/sales_channel_module/sales_channel_details/controllers/sales_channel_details_controller.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductCheckboxListTile extends GetView<SalesChannelDetailsController> {
  const ProductCheckboxListTile(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    return Slidable(
      groupTag: const Key('sales'),
      key: ValueKey(product.id!),
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.popRoute();
              context.pushRoute(ProductDetailsRoute(productId: product.id!));
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: CupertinoIcons.person_crop_square,
            // label: 'Details',
          ),
          SlidableAction(
            onPressed: (_) async {
              await controller.removeProducts(id: product.id!);
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            // label: 'Remove',
          ),
        ],
      ),
      child: CheckboxListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        secondary: product.thumbnail != null
            ? SizedBox(
                width: 45,
                child: CachedNetworkImage(
                  key: ValueKey(product.thumbnail),
                  imageUrl: product.thumbnail!,
                  placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                  errorWidget: (context, string, error) => const Icon(Icons.warning_rounded, color: Colors.redAccent),
                ))
            : null,
        controlAffinity: ListTileControlAffinity.leading,
        value: controller.selectedProducts.contains(product.id),
        onChanged: (val) {
          if (val == null) return;
          if (val) {
            controller.selectedProducts.add(product.id!);
            if (controller.selectedProducts.length == controller.pagingController.itemList?.length) {
              controller.selectAll = true;
            }
          } else {
            controller.selectedProducts.remove(product.id!);
            controller.selectAll = false;
          }
          controller.update();
        },
        title: Text(product.title!),
        subtitle: Text(product.collection?.title ?? '-', style: smallTextStyle),
      ),
    );
  }
}
