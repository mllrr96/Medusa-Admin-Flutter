import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/components/date_time_card.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../components/currency_formatter.dart';

class OrderTimeline extends GetView<OrderDetailsController> {
  const OrderTimeline(this.order, {Key? key, this.onExpansionChanged}) : super(key: key);
  final Order order;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      key: controller.timelineKey,
      onExpansionChanged: onExpansionChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text('Timeline'),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder<List<OrderEdit>?>(
            future: controller.fetchOrderEdits(),
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: asyncSnapshot.data?.length,
                  itemBuilder: (context, index) {
                    final orderEdit = asyncSnapshot.data?[index];
                    if (orderEdit == null) {
                      return const SizedBox.shrink();
                    }
                    return OrderEditRequestWidget(order, orderEdit: orderEdit);
                  },
                );
              } else if (!asyncSnapshot.hasData) {
                return const SizedBox.shrink();
              }

              if (asyncSnapshot.hasError) {
                return Column(
                  children: [
                    const Text('Error fetching order edits'),
                    OutlinedButton(onPressed: () {}, child: const Text('Retry'))
                  ],
                );
              }

              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }),
        // if (controller.orderEdits != null)
        //   ListView.builder(
        //       shrinkWrap: true,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemCount: controller.orderEdits?.length,
        //       itemBuilder: (context, index) {
        //         final orderEdit = controller.orderEdits?[index];
        //         if (orderEdit == null) {
        //           return const SizedBox.shrink();
        //         }
        //         return OrderEditRequestWidget(order, orderEdit: orderEdit);
        //       }),
        // Divider(),
        OrderPlacedWidget(order),
      ],
    );
  }
}

class OrderPlacedWidget extends StatefulWidget {
  const OrderPlacedWidget(this.order, {super.key});
  final Order order;

  @override
  State<OrderPlacedWidget> createState() => _OrderPlacedWidgetState();
}

class _OrderPlacedWidgetState extends State<OrderPlacedWidget> {
  bool showTimeAgo = true;
  @override
  Widget build(BuildContext context) {
    final durationDiff = DateTime.now().difference(widget.order.createdAt ?? DateTime.now());
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final total = CurrencyTextInputFormatter(name: widget.order.currencyCode).format(widget.order.total.toString());
    return InkWell(
      onTap: () {
        setState(() {
          showTimeAgo = !showTimeAgo;
        });
      },
      child: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline),
              const SizedBox(width: 12.0),
              Text('Order Placed', style: smallTextStyle),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.transparent),
              const SizedBox(width: 12.0),
              AnimatedCrossFade(
                firstChild: Text(
                    '${timeago.format(DateTime.now().subtract(durationDiff))} · ${widget.order.currency?.symbolNative ?? ''} $total',
                    style: smallTextStyle?.copyWith(color: lightWhite)),
                secondChild: Text(
                    '${formatDate(widget.order.createdAt)} ${formatTime(widget.order.createdAt)} · ${widget.order.currency?.symbolNative ?? ''} $total',
                    style: smallTextStyle?.copyWith(color: lightWhite)),
                crossFadeState: showTimeAgo ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderEditRequestWidget extends GetView<OrderDetailsController> {
  const OrderEditRequestWidget(this.order, {super.key, required this.orderEdit});
  final Order order;
  final OrderEdit orderEdit;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final durationDiff = DateTime.now().difference(orderEdit.requestedAt ?? DateTime.now());
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
    final buttons = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: buttonShape,
                  ),
                  onPressed: () async {
                    // TODO: Figure out how to get the link
                    // await Clipboard.setData(ClipboardData( text: ));
                  },
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
                  onPressed: () async {},
                  child: const Text('Force Confirm', overflow: TextOverflow.ellipsis)),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: buttonShape,
                  ),
                  onPressed: () {},
                  child: const Text('Cancel Order Edit',
                      style: TextStyle(color: Colors.red), overflow: TextOverflow.ellipsis)),
            ),
          ],
        ),
      ],
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

    Widget userName() {
      return FutureBuilder<User?>(
          future: controller.getUserById(orderEdit.createdBy ?? ''),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data!;
              final name = '${user.firstName ?? ''} ${user.lastName ?? ''}';
              final email = user.email;
              final text = name.removeAllWhitespace.isNotEmpty ? '$name ($email)' : email;
              return Text(
                text ?? '',
                style: smallTextStyle?.copyWith(color: lightWhite),
              );
            } else if (!snapshot.hasData) {
              return GestureDetector(
                  onTap: () async => controller.getUserById(orderEdit.createdBy ?? ''),
                  child: Text(
                    'Error loading user, tap to retry',
                    style: smallTextStyle?.copyWith(color: lightWhite),
                  ));
            }

            if (snapshot.hasError) {
              return GestureDetector(
                  onTap: () async => controller.getUserById(orderEdit.createdBy ?? ''),
                  child: Text(
                    'Error loading user, tap to retry',
                    style: smallTextStyle?.copyWith(color: lightWhite),
                  ));
            }

            return const Skeletonizer(child: Text('Loading user'));
          });
    }

    return Column(
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
                          '${timeago.format(DateTime.now().subtract(durationDiff))} by ',
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
                          if (orderEdit.status == OrderEditStatus.requested && (removedItems?.isEmpty ?? false)) buttons
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
                          if (orderEdit.status == OrderEditStatus.requested) buttons
                        ],
                      ),
                    space,
                  ],
                ),
              ),
            ],
          )
      ],
    );
  }
}
