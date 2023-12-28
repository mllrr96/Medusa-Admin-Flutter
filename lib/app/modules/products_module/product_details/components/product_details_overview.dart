import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/products_module/add_update_product/controllers/add_update_product_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/route/app_router.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsOverview extends GetView<ProductDetailsController> {
  const ProductDetailsOverview({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: context.theme.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(product.title ?? '')),
              AdaptiveIcon(
                onPressed: () async {
                  await showModalActionSheet<int>(context: context, actions: [
                    const SheetAction(
                        label: 'Edit General Information', key: 0),
                    const SheetAction(label: 'Edit Sales Channels', key: 1),
                    const SheetAction(
                        label: 'Delete Product',
                        isDestructiveAction: true,
                        key: 2),
                  ]).then((result) async {
                    if (result != null) {
                      switch (result) {
                        case 0:
                          await context
                              .pushRoute(AddUpdateProductRoute(
                                  updateProductReq: UpdateProductReq(
                                      product: product, number: 0)))
                              .then((result) async {
                            if (result != null) {
                              await controller.fetchProduct();
                            }
                          });
                          break;
                        case 2:
                          await showOkCancelAlertDialog(
                                  context: context,
                                  title: 'Confirm product deletion',
                                  message:
                                      'Are you sure you want to delete this product? \n This action is irreversible',
                                  isDestructiveAction: true)
                              .then((result) async {
                            if (result == OkCancelResult.ok) {
                              await controller.deleteProduct(product.id!, context);
                            }
                          });

                          break;
                      }
                    }
                  });
                },
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          if (product.description?.isNotEmpty ?? false)
            Column(
              children: [
                space,
                Text(product.description ?? '',
                    style: mediumTextStyle!.copyWith(color: manatee)),
              ],
            ),
          const Divider(),
          if (product.tags?.isNotEmpty ?? false)
            Column(
              children: [
                Wrap(
                  spacing: 12,
                  children: product.tags
                          ?.map((e) => Chip(
                                  label: Text(
                                e.value ?? '',
                                style: smallTextStyle,
                              )))
                          .toList() ??
                      [],
                ),
                space,
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Details', style: mediumTextStyle),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text('Subtitle',
                          style: mediumTextStyle!.copyWith(color: manatee))),
                  Flexible(
                      child: Text(product.subtitle ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text('Handle',
                          style: mediumTextStyle.copyWith(color: manatee))),
                  Flexible(
                      flex: 2,
                      child: Text(product.handle ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text('Type',
                          style: mediumTextStyle.copyWith(color: manatee))),
                  Flexible(
                      flex: 2,
                      child: Text(product.type?.value ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text('Collection',
                          style: mediumTextStyle.copyWith(color: manatee))),
                  Flexible(
                      flex: 2,
                      child: Text(product.collection?.title ?? '-',
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text('Discountable',
                          style: mediumTextStyle.copyWith(color: manatee))),
                  Flexible(
                      flex: 2,
                      child: Text(
                          product.discountable.toString().capitalize ??
                              product.discountable.toString(),
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              space,
              Text('Sales Channel', style: mediumTextStyle),
              space,
            ],
          )
        ],
      ),
    );
  }
}
