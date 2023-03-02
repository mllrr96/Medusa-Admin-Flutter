import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import '../../../../../core/utils/colors.dart';
import '../../../data/models/store/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(
    this.order, {
    Key? key,
    this.onTap,
  }) : super(key: key);
  final Order order;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    String? getName() {
      String? name;

      if (order.billingAddress?.firstName != null && order.billingAddress?.lastName != null) {
        name = '${order.billingAddress!.firstName ?? ''} ${order.billingAddress!.lastName ?? ''}';
      }
      if (order.shippingAddress?.firstName != null && order.shippingAddress?.lastName != null) {
        name = '${order.shippingAddress!.firstName ?? ''} ${order.shippingAddress!.lastName ?? ''}';
      }
      if (order.customer?.firstName != null && order.customer?.lastName != null) {
        name = '${order.customer!.firstName ?? ''} ${order.customer!.lastName ?? ''}';
      }
      return name;
    }

    return InkWell(
      onTap: onTap ?? () => Get.toNamed(Routes.ORDER_DETAILS, arguments: order.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor, borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('#${order.displayId}', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 2.0),
                    Text(
                      order.cart!.createdAt != null
                          ? 'on ${DateFormat.MEd().format(order.cart!.createdAt!)} at ${DateFormat.jm().format(order.cart!.createdAt!)}'
                          : '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                Text(
                  '${order.total} ${order.currencyCode?.toUpperCase()} ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            if (order.items != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: buildImages(context),
              ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OrderStatusLabel(orderStatus: order.status),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(child: Text(getName()?[0] ?? order.customer!.email[0])),
                      const SizedBox(width: 6.0),
                      if (getName() != null) Flexible(child: Text(getName()!, style: mediumTextStyle)),
                      if (getName() == null)
                        Flexible(
                            child:
                                Text(order.customer!.email, style: mediumTextStyle, overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                )
                // Opacity(
                //   opacity: order.status != OrderStatus.pending ? 1 : 0,
                //   child: InkWell(
                //     onTap: order.status != OrderStatus.pending ? () {} : null,
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //             color: ColorManager.primary,
                //             width: 2,
                //           ),
                //           borderRadius: const BorderRadius.all(Radius.circular(4))),
                //       child: Row(
                //         children: [
                //           Icon(Icons.refresh, color: ColorManager.primary),
                //           Text(
                //             'Reorder',
                //             style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.primary),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImages(BuildContext context) {
    if (order.items!.length > 3) {
      return Row(
        children: [
          ...List.generate(
              3,
              (index) => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.grey.shade300),
                            image: DecorationImage(
                                fit: BoxFit.cover, image: CachedNetworkImageProvider(order.items![index].thumbnail!))),
                      ),
                      const SizedBox(width: 10)
                    ],
                  )),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
                child: Text('+ ${order.items!.length - 3}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Get.isDarkMode ? Colors.white : Colors.grey))),
          ),
        ],
      );
    }

    return Row(
      children: List.generate(
          order.items!.length,
          (index) => Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey.shade300),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: CachedNetworkImageProvider(order.items![index].thumbnail!))),
                  ),
                  const SizedBox(width: 10)
                ],
              )),
    );
  }
}

class OrderStatusLabel extends StatelessWidget {
  const OrderStatusLabel({Key? key, required this.orderStatus}) : super(key: key);
  final OrderStatus orderStatus;
  @override
  Widget build(BuildContext context) {
    var containerColor = ColorManager.primary.withOpacity(0.17);
    var textColor = ColorManager.primary;
    String text = 'Upcoming';
    switch (orderStatus) {
      case OrderStatus.pending:
        containerColor = ColorManager.primary.withOpacity(0.17);
        textColor = ColorManager.primary;
        text = 'Pending';
        break;
      case OrderStatus.canceled:
        containerColor = Colors.red.withOpacity(0.17);
        textColor = Colors.redAccent;
        text = 'Canceled';
        break;
      case OrderStatus.completed:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = 'Completed';
        break;
      case OrderStatus.archived:
        containerColor = Colors.green.withOpacity(0.17);
        textColor = Colors.green;
        text = 'Archived';
        break;
      case OrderStatus.requiresAction:
        containerColor = Colors.red.withOpacity(0.17);
        textColor = Colors.redAccent;
        text = 'Require Action';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor),
      ),
    );
  }
}
