import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/medusa_icons_icons.dart';
import '../../../../../data/models/store/order.dart';
import '../../../../../data/models/store/order_edit.dart';
import '../../../../../data/models/store/order_item_change.dart';
import '../../../../components/currency_formatter.dart';
import 'package:timeago/timeago.dart' as timeago;

class OrderEditWidget extends GetView<OrderDetailsController> {
  const OrderEditWidget(this.order, {super.key, required this.orderEdit});

  final Order order;
  final OrderEdit orderEdit;

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final reqDurationDiff = DateTime.now().difference(orderEdit.requestedAt ?? DateTime.now());
    final canceledDurationDiff = DateTime.now().difference(orderEdit.canceledAt ?? DateTime.now());
    final declinedDurationDiff = DateTime.now().difference(orderEdit.declinedAt ?? DateTime.now());
    final confirmedDurationDiff = DateTime.now().difference(orderEdit.confirmedAt ?? DateTime.now());
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    var addedItems = orderEdit.changes?.where((element) => element.type == OrderEditItemChangeType.itemAdd).toList();

    var removedItems =
        orderEdit.changes?.where((element) => element.type == OrderEditItemChangeType.itemRemove).toList();

    orderEdit.changes?.forEach(
      (element) {
        final origQuantity = element.originalLineItem?.quantity;
        final quantity = element.lineItem?.quantity;
        if (element.type != OrderEditItemChangeType.itemUpdate) {
          return;
        }

        if (quantity?.isGreaterThan(origQuantity as num) ?? false) {
          addedItems?.add(element);
        } else if (quantity?.isLowerThan(origQuantity as num) ?? false) {
          removedItems?.add(element);
        }
      },
    );

    const space = SizedBox(height: 12.0);
    const halfSpace = SizedBox(height: 6.0);
    const buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
    Widget payment() {
      final formatter = CurrencyTextInputFormatter(name: order.currency?.code);
      if (orderEdit.status != OrderEditStatus.requested) {
        return const SizedBox.shrink();
      }
      num removedPrice = 0;
      num addedPrice = 0;
      removedItems?.forEach((element) {
        final quantity = ((element.lineItem?.quantity ?? 0) - (element.originalLineItem?.quantity ?? 0)).abs();
        removedPrice += (element.originalLineItem?.unitPrice ?? 0) * quantity;
      });
      addedItems?.forEach((element) {
        final quantity = ((element.lineItem?.quantity ?? 0) - (element.originalLineItem?.quantity ?? 0)).abs();
        addedPrice += (element.lineItem?.unitPrice ?? 0) * quantity;
      });
      final requiredPrice = (removedPrice - addedPrice).abs() - (order.refundedTotal ?? 0);

      if (orderEdit.differenceDue?.isNegative ?? false) {
        return Column(
          children: [
            Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.red),
                const SizedBox(width: 12.0),
                Text('Refund Required', style: smallTextStyle)
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
                      child: Text(
                        'Refund ${order.currency?.symbolNative ?? ''} ${formatter.format(requiredPrice.toString())}',
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
                Text(
                    'a few seconds ago · ${order.currency?.symbolNative ?? ''} ${formatter.format(requiredPrice.toString())}',
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

    Future<void> onCancelTap() async {
      await showOkCancelAlertDialog(
        context: context,
        title: 'Cancel Order Edit?',
        message: 'Are you sure you want to cancel this order edit?',
        okLabel: 'Yes, Cancel',
        cancelLabel: 'No',
        isDestructiveAction: true,
      ).then((result) async {
        if (result == OkCancelResult.ok) {
          await controller.cancelOrderEdit(orderEdit.id ?? '');
        }
      });
    }

    Future<void> onConfirmTap() async {
      await showOkCancelAlertDialog(
        context: context,
        title: 'Force confirm order edit?',
        message:
            'By force confirming you allow the order edit to be fulfilled. You will still have to reconcile payments manually after confirming.',
        okLabel: 'Yes, Force confirm',
        isDestructiveAction: true,
      ).then((result) async {
        if (result == OkCancelResult.ok) {
          await controller.confirmOrderEdit(orderEdit.id ?? '');
        }
      });
    }

    Widget orderStatus = const SizedBox();

    switch (orderEdit.status) {
      case OrderEditStatus.confirmed:
        orderStatus = Row(
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
                          '${timeago.format(DateTime.now().subtract(confirmedDurationDiff))} by ',
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
        );
      case OrderEditStatus.declined:
        orderStatus = Row(
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
                          '${timeago.format(DateTime.now().subtract(declinedDurationDiff))} by ',
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
        );
      case OrderEditStatus.requested:
      case OrderEditStatus.created:
      // TODO: Handle this case.
      case OrderEditStatus.canceled:
      orderStatus = Row(
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
                        '${timeago.format(DateTime.now().subtract(canceledDurationDiff))} by ',
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
      );
    }
    return Column(
      children: [
        orderStatus,
        space,
        Column(
          children: [
            payment(),
            Row(
              children: [
                const Icon(MedusaIcons.pencil_square_solid),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Edit requested', style: smallTextStyle),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${timeago.format(DateTime.now().subtract(reqDurationDiff))} by ',
                              style: smallTextStyle?.copyWith(color: lightWhite),
                            ),
                          ),
                          Flexible(child: userName()),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            if (orderEdit.changes?.isNotEmpty ?? false)
              Row(
                children: [
                  const Icon(MedusaIcons.pencil_square_solid, color: Colors.transparent),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      children: [
                        if (addedItems?.isNotEmpty ?? false)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              space,
                              Text('Added', style: smallTextStyle?.copyWith(color: lightWhite)),
                              space,
                              ListView.separated(
                                  separatorBuilder: (_, __) => halfSpace,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: addedItems!.length,
                                  itemBuilder: (context, index) {
                                    final item = addedItems[index];
                                    int quantityAdded =
                                        (item.lineItem?.quantity ?? 0) - (item.originalLineItem?.quantity ?? 0);
                                    String quantityAddedString =
                                        quantityAdded != 1 && quantityAdded != 0 ? '${quantityAdded}x ' : '';
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: item.lineItem?.thumbnail != null
                                          ? ConstrainedBox(
                                              constraints: const BoxConstraints(maxWidth: 50),
                                              child: CachedNetworkImage(
                                                imageUrl: item.lineItem?.thumbnail ?? '',
                                                fit: BoxFit.fitHeight,
                                              ))
                                          : null,
                                      title: Text(quantityAddedString + (item.lineItem?.title ?? '')),
                                      subtitle: quantityAddedString.isNotEmpty
                                          ? Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  quantityAddedString,
                                                  style: const TextStyle(color: Colors.transparent),
                                                ),
                                                Text(
                                                  item.lineItem?.variant?.title ?? '',
                                                  style: smallTextStyle?.copyWith(color: lightWhite),
                                                ),
                                              ],
                                            )
                                          : Text(
                                              item.lineItem?.variant?.title ?? '',
                                              style: smallTextStyle?.copyWith(color: lightWhite),
                                            ),
                                    );
                                  }),
                              space,
                              if (orderEdit.status == OrderEditStatus.requested && (removedItems?.isEmpty ?? false))
                                EditRequestButton(
                                  onCopyTap: () {
                                    // TODO: Figure out how to get the link
                                    // await Clipboard.setData(ClipboardData( text: ));
                                  },
                                  onCancelTap: onCancelTap,
                                  onForceConfirmTap: onConfirmTap,
                                )
                            ],
                          ),
                        if (removedItems?.isNotEmpty ?? false)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              space,
                              Text('Removed', style: smallTextStyle?.copyWith(color: lightWhite)),
                              space,
                              ListView.separated(
                                  separatorBuilder: (_, __) => halfSpace,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: removedItems!.length,
                                  itemBuilder: (context, index) {
                                    final item = removedItems[index].originalLineItem;
                                    int quantityRemoved =
                                        (item?.quantity ?? 0) - (removedItems[index].lineItem?.quantity ?? 0);
                                    String quantityRemovedString =
                                        quantityRemoved != 1 && quantityRemoved != 0 ? '${quantityRemoved}x ' : '';

                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: item?.thumbnail != null
                                          ? ConstrainedBox(
                                              constraints: const BoxConstraints(maxWidth: 50),
                                              child: CachedNetworkImage(imageUrl: item?.thumbnail ?? ''))
                                          : null,
                                      title: Text(quantityRemovedString + (item?.title ?? '')),
                                      subtitle: quantityRemovedString.isNotEmpty
                                          ? Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  quantityRemovedString,
                                                  style: const TextStyle(color: Colors.transparent),
                                                ),
                                                Text(
                                                  item?.variant?.title ?? '',
                                                  style: smallTextStyle?.copyWith(color: lightWhite),
                                                ),
                                              ],
                                            )
                                          : Text(
                                              item?.variant?.title ?? '',
                                              style: smallTextStyle?.copyWith(color: lightWhite),
                                            ),
                                    );
                                  }),
                              space,
                              if (orderEdit.status == OrderEditStatus.requested)
                                EditRequestButton(
                                  onCopyTap: () {
                                    // TODO: Figure out how to get the link
                                    // await Clipboard.setData(ClipboardData( text: ));
                                  },
                                  onCancelTap: onCancelTap,
                                  onForceConfirmTap: onConfirmTap,
                                )
                            ],
                          ),
                        space,
                      ],
                    ),
                  ),
                ],
              )
          ],
        ),
      ],
    );
  }
}

class EditRequestButton extends StatelessWidget {
  const EditRequestButton({super.key, this.onCopyTap, this.onForceConfirmTap, this.onCancelTap});

  final void Function()? onCopyTap;
  final void Function()? onForceConfirmTap;
  final void Function()? onCancelTap;

  @override
  Widget build(BuildContext context) {
    const buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: buttonShape,
                  ),
                  onPressed: onCopyTap,
                  child: const Text('Copy Confirmation-Request Link', overflow: TextOverflow.ellipsis)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: buttonShape,
                  ),
                  onPressed: onForceConfirmTap,
                  child: const Text('Force Confirm', overflow: TextOverflow.ellipsis)),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: buttonShape,
                  ),
                  onPressed: onCancelTap,
                  child: const Text('Cancel Order Edit',
                      style: TextStyle(color: Colors.red), overflow: TextOverflow.ellipsis)),
            ),
          ],
        ),
      ],
    );
  }
}
