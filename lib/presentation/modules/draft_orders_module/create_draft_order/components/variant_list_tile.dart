import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';


class VariantListTile extends StatelessWidget {
  const VariantListTile(
    this.lineItem, {
    super.key,
    this.onDelete,
    this.onAddTap,
    this.onRemoveTap,
    required this.selectedRegion,
  });
  final LineItem lineItem;
  final void Function()? onDelete;
  final void Function()? onAddTap;
  final void Function()? onRemoveTap;
  final Region? selectedRegion;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final productVariant = lineItem.variant!;
    MoneyAmount? moneyAmount;
    final priceList = productVariant.prices?.where((e) => e.currencyCode == selectedRegion?.currencyCode);
    if (priceList?.isNotEmpty ?? false) {
      moneyAmount = priceList!.first;
    } else {
      moneyAmount = (productVariant.prices?.isNotEmpty ?? false)
          ? productVariant.prices!.first
          : const MoneyAmount(amount: 0, currencyCode: 'USD');
    }

    const space = Gap(12);
    return Slidable(
      groupTag: const Key('variants'),
      key: ValueKey(productVariant.id!),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              if (onDelete != null) {
                onDelete!();
              }
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                //Image
                if (productVariant.product?.thumbnail != null)
                  SizedBox(
                      width: 45,
                      child: CachedNetworkImage(
                        key: ValueKey(productVariant.product!.thumbnail!),
                        imageUrl: productVariant.product!.thumbnail!,
                        placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                        errorWidget: (context, string, error) =>
                            const Icon(Icons.warning_rounded, color: Colors.redAccent),
                      )),
                space,
                // Product, Variant name and price
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productVariant.product?.title ?? '',
                        style: mediumTextStyle,
                      ),
                      Text(productVariant.title ?? '',
                          style: smallTextStyle?.copyWith(color: lightWhite),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text(moneyAmount.amount.formatAsPrice(moneyAmount.currencyCode),
                          style: smallTextStyle?.copyWith(color: lightWhite),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Variant quantity
          Row(
            children: [
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.remove),
                padding: EdgeInsets.zero,
              ),
              Text(lineItem.quantity?.toString() ?? '0'),
              IconButton(
                onPressed: onAddTap,
                icon: const Icon(Icons.add),
                padding: EdgeInsets.zero,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomVariantListTile extends StatelessWidget {
  const CustomVariantListTile(
    this.lineItem, {
    super.key,
    this.onDelete,
    this.onAddTap,
    this.onRemoveTap,
    required this.currencyCode,
  });
  final LineItem lineItem;
  final String currencyCode;
  final void Function()? onDelete;
  final void Function()? onAddTap;
  final void Function()? onRemoveTap;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    return Slidable(
      groupTag: const Key('variants'),
      key: ValueKey(lineItem.title!),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              if (onDelete != null) {
                onDelete!();
              }
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                space,
                // Product, Variant name and price
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lineItem.title ?? '',
                        style: mediumTextStyle,
                      ),
                      Text(lineItem.unitPrice.formatAsPrice(currencyCode),
                          style: smallTextStyle?.copyWith(color: lightWhite),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Variant quantity
          Row(
            children: [
              IconButton(
                onPressed: onRemoveTap,
                icon: const Icon(Icons.remove),
                padding: EdgeInsets.zero,
              ),
              Text(lineItem.quantity?.toString() ?? '0'),
              IconButton(
                onPressed: onAddTap,
                icon: const Icon(Icons.add),
                padding: EdgeInsets.zero,
              ),
            ],
          )
        ],
      ),
    );
  }
}
