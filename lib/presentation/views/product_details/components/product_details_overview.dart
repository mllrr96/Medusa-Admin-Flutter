import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/data/models/update_product_req.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class ProductDetailsOverview extends StatelessWidget {
  const ProductDetailsOverview({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
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
              IconButton(
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
                              context.read<ProductCrudBloc>().add(ProductCrudEvent.loadWithVariants(product.id!));
                            }
                          });
                          break;
                        case 1:
                          await context
                              .pushRoute(AddUpdateProductRoute(
                                  updateProductReq: UpdateProductReq(
                                      product: product, number: 1)))
                              .then((result) async {
                            if (result != null) {
                               context.read<ProductCrudBloc>().add(ProductCrudEvent.loadWithVariants(product.id!));
                            }
                          });
                        case 2:
                          await showOkCancelAlertDialog(
                                  context: context,
                                  title: 'Confirm product deletion',
                                  message:
                                      'Are you sure you want to delete this product? \n This action is irreversible',
                                  isDestructiveAction: true)
                              .then((result) async {
                            if (result == OkCancelResult.ok) {
                              context
                                  .read<ProductCrudBloc>()
                                  .add(ProductCrudEvent.delete(product.id!));
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
                          product.discountable.toString().capitalize,
                          style: mediumTextStyle.copyWith(color: manatee),
                          textAlign: TextAlign.right)),
                ],
              ),
              space,
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sales Channel', style: mediumTextStyle),
                  if (product.salesChannels?.isEmpty ?? true)
                    Text('-', style: mediumTextStyle),
                ],
              ),
              space,
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: product.salesChannels
                        ?.map((e) => Chip(
                                label: Text(
                              e.name ?? '',
                              style: smallTextStyle,
                            )))
                        .toList() ??
                    [],
              )
            ],
          )
        ],
      ),
    );
  }
}
