import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../../core/utils/colors.dart';
import '../../controllers/order_details_controller.dart';

class OrderEditStatusWidget extends GetView<OrderDetailsController> {
  const OrderEditStatusWidget(this.order, {super.key, required this.orderEdit});
  final OrderEdit orderEdit;
  final Order order;

  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final canceledDurationDiff = DateTime.now().difference(orderEdit.canceledAt ?? DateTime.now());
    final declinedDurationDiff = DateTime.now().difference(orderEdit.declinedAt ?? DateTime.now());
    final confirmedDurationDiff = DateTime.now().difference(orderEdit.confirmedAt ?? DateTime.now());
    const space = Gap(12);
    const buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
    Widget payment() {
      if (orderEdit.status != OrderEditStatus.requested) {
        return const SizedBox.shrink();
      }
      if (orderEdit.differenceDue?.isNegative ?? false) {
        return Column(
          children: [
            Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.red),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Refund Required', style: smallTextStyle),
                    Text('a few seconds age', style: smallTextStyle?.copyWith(color: lightWhite)),
                  ],
                )
              ],
            ),
            space,
            Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.transparent),
                const SizedBox(width: 12.0),
                Expanded(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(shape: buttonShape),
                      onPressed: () {},
                      child: Text(
                        'Refund ${orderEdit.differenceDue?.abs().formatAsPrice(order.currencyCode)}',
                        style: const TextStyle(color: Colors.red),
                      )),
                ),
              ],
            ),
            space,
          ],
        );
      } else if (orderEdit.differenceDue?.isGreaterThan(0) ?? false) {
        return Column(
          children: [
            Row(
              children: [
                Icon(Icons.error_outline, color: ColorManager.primary),
                const SizedBox(width: 12.0),
                Text('Customer payment required', style: smallTextStyle)
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.transparent,
                ),
                const SizedBox(width: 12.0),
                Text('a few seconds ago · ${orderEdit.differenceDue.formatAsPrice(order.currencyCode)}',
                    style: smallTextStyle?.copyWith(color: lightWhite))
              ],
            ),
            space,
            Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.transparent),
                const SizedBox(width: 12.0),
                Expanded(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: buttonShape,
                      ),
                      onPressed: () {},
                      child: const Text('Copy Payment Link', overflow: TextOverflow.ellipsis)),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: buttonShape,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Mark As Paid',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            space,
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    Widget userName({String? user}) {
      if (controller.loadedUsers.isNotEmpty &&
          controller.loadedUsers.map((e) => e.id).toList().contains(user ?? orderEdit.createdBy)) {
        final user = controller.loadedUsers.where((element) => element.id == orderEdit.createdBy).first;
        final name = '${user.firstName ?? ''} ${user.lastName ?? ''}';
        final email = user.email;
        final text = name.removeAllWhitespace.isNotEmpty ? name : email;
        return Text(
          text ?? '',
          style: smallTextStyle?.copyWith(color: lightWhite),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
      }
      return GestureDetector(
        onTap: () async => await controller.fetchUser(orderEdit.createdBy ?? ''),
        child: Text(
          'Error loading user, tap to retry',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: smallTextStyle?.copyWith(color: Colors.redAccent),
        ),
      );
    }

    switch (orderEdit.status) {
      case OrderEditStatus.confirmed:
        return Column(
          children: [
            Row(
              children: [
                const Icon(Icons.check_circle),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Edit force confirmed', style: smallTextStyle),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${DateTime.now().subtract(confirmedDurationDiff).timeAgo()} by ',
                              style: smallTextStyle?.copyWith(color: lightWhite),
                            ),
                          ),
                          Flexible(child: userName(user: orderEdit.confirmedBy)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            space,
          ],
        );
      case OrderEditStatus.declined:
        return Column(
          children: [
            Row(
              children: [
                const Icon(Icons.close_sharp),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Edit declined', style: smallTextStyle),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${DateTime.now().subtract(declinedDurationDiff).timeAgo()} by ',
                              style: smallTextStyle?.copyWith(color: lightWhite),
                            ),
                          ),
                          Flexible(child: userName(user: orderEdit.declinedBy)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            space,
          ],
        );
      case OrderEditStatus.canceled:
        return Column(
          children: [
            Row(
              children: [
                const Icon(Icons.close_sharp),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Edit canceled', style: smallTextStyle),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${DateTime.now().subtract(canceledDurationDiff).timeAgo()} by ',
                              style: smallTextStyle?.copyWith(color: lightWhite),
                            ),
                          ),
                          Flexible(child: userName(user: orderEdit.canceledBy)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            space,
          ],
        );
      case OrderEditStatus.requested:
        return payment();
      case OrderEditStatus.created:
        return const SizedBox.shrink();
    }
  }
}
