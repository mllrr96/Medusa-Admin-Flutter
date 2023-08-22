
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/store/line_item.dart';

class VariantListTile extends StatelessWidget {
  const VariantListTile(
      this.lineItem, {
        super.key,
        this.onDelete,
        this.onAddTap,
        this.onRemoveTap,
      });
  final LineItem lineItem;
  final void Function()? onDelete;
  final void Function()? onAddTap;
  final void Function()? onRemoveTap;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final productVariant = lineItem.variant!;
    String getCurrencyText() {
      double value = productVariant.prices?[0].amount?.roundToDouble() ?? 0.0;
      final valueFormatter =
      NumberFormat.currency(name: productVariant.prices?[0].currencyCode);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      return '${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]} ${valueFormatter.currencySymbol.toUpperCase()}';
    }

    const space = SizedBox(width: 12.0);
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
                        placeholder: (context, text) => const Center(
                            child: CircularProgressIndicator.adaptive()),
                        errorWidget: (context, string, error) => const Icon(
                            Icons.warning_rounded,
                            color: Colors.redAccent),
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
                      Text(getCurrencyText(),
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
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    String getCurrencyText() {
      double value = lineItem.unitPrice?.roundToDouble() ?? 0.0;
      final valueFormatter = NumberFormat.currency(name: currencyCode);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      return '${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]} ${valueFormatter.currencySymbol.toUpperCase()}';
    }

    const space = SizedBox(width: 12.0);
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
                      Text(getCurrencyText(),
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
