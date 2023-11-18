import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../data/models/store/line_item.dart';
import '../../../../data/models/store/money_amount.dart';
import '../../../../data/models/store/region.dart';
import '../../../components/currency_formatter.dart';

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
    final priceList = productVariant.prices
        ?.where((e) => e.currencyCode == selectedRegion?.currencyCode);
    if (priceList?.isNotEmpty ?? false) {
      moneyAmount = priceList!.first;
    } else {
      moneyAmount = (productVariant.prices?.isNotEmpty ?? false)
          ? productVariant.prices!.first
          : MoneyAmount(amount: 0, currencyCode: 'USD');
    }

    String getPrice(num? price) {
      final currencyFormatter =
          CurrencyTextInputFormatter(name: moneyAmount?.currencyCode);
      return '${moneyAmount?.currencyCode?.toUpperCase() ?? ''} ${currencyFormatter.format(price.toString())}';
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
                      Text(getPrice(moneyAmount.amount),
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
    String getCurrencyText() {
      double value = lineItem.unitPrice?.roundToDouble() ?? 0.0;
      final valueFormatter = NumberFormat.currency(name: currencyCode);
      if (valueFormatter.decimalDigits != null) {
        value = value / pow(10, valueFormatter.decimalDigits!).roundToDouble();
      }
      return '${valueFormatter.format(value).split(valueFormatter.currencySymbol)[1]} ${valueFormatter.currencySymbol.toUpperCase()}';
    }

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
