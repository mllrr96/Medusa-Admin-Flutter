import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/products/product_details/controllers/product_details_controller.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/enums.dart';

class ProductDetailsOverview extends GetView<ProductDetailsController> {
  const ProductDetailsOverview({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    const space = SizedBox(height: 12.0);
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: Theme.of(context).expansionTileTheme.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(product.title ?? '')),
              IconButton(
                onPressed: () async {
                  await showModalActionSheet<ProductComponents>(context: context, actions: [
                    const SheetAction(label: 'Edit General Information', key: ProductComponents.generalInfo),
                    const SheetAction(label: 'Edit Sales Channels', key: ProductComponents.salesChannel),
                    const SheetAction(
                        label: 'Delete Product', isDestructiveAction: true, key: ProductComponents.editVariants),
                  ]).then((result) async {
                    if (result != null) {
                      switch (result) {
                        case ProductComponents.generalInfo:
                          Get.toNamed(Routes.ADD_UPDATE_PRODUCT, arguments: [product, ProductComponents.generalInfo]);
                          break;
                        case ProductComponents.editVariants:
                          final confirmDelete = await showOkCancelAlertDialog(
                              context: context,
                              title: 'Confirm product deletion',
                              message: 'Are you sure you want to delete this product? \n This action is irreversible',
                              isDestructiveAction: true);
                          if (confirmDelete != OkCancelResult.ok) {
                            return;
                          }
                          await controller.deleteProduct(product.id!);
                          break;
                        case ProductComponents.editOptions:
                        case ProductComponents.editAttributes:
                        case ProductComponents.editThumbnail:
                        case ProductComponents.editMedia:
                        case ProductComponents.salesChannel:
                        case ProductComponents.addVariant:
                          return;
                      }
                    }
                  });
                },
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          if (product.description != null) space,
          if (product.description != null)
            Text(product.description ?? '', style: mediumTextStyle!.copyWith(color: lightWhite)),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Details', style: mediumTextStyle),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Subtitle', style: mediumTextStyle!.copyWith(color: lightWhite))),
                  Expanded(
                      flex: 2,
                      child: Text(product.subtitle ?? '-',
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Handle', style: mediumTextStyle.copyWith(color: lightWhite))),
                  Expanded(
                      flex: 2,
                      child: Text(product.handle ?? '-',
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Type', style: mediumTextStyle.copyWith(color: lightWhite))),
                  Expanded(
                      flex: 2,
                      child: Text(product.type?.value ?? '-',
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Collection', style: mediumTextStyle.copyWith(color: lightWhite))),
                  Expanded(
                      flex: 2,
                      child: Text(product.collection?.title ?? '-',
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text('Discountable', style: mediumTextStyle.copyWith(color: lightWhite))),
                  Expanded(
                      flex: 2,
                      child: Text(product.discountable.toString().capitalize ?? product.discountable.toString(),
                          style: mediumTextStyle.copyWith(color: lightWhite), textAlign: TextAlign.right)),
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
