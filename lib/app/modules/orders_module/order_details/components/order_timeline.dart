import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/components/date_time_card.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
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

class OrderEditRequestWidget extends StatelessWidget {
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
                  child: const Text('Copy Confirmation-Request Link')),
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
                  child: const Text('Force Confirm')),
            ),
            const SizedBox(width: 6.0),
            Expanded(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: buttonShape,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Cancel Order Edit',
                    style: TextStyle(color: Colors.red),
                  )),
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
      num refundAmount = 0;
      num addedPrice = 0;
      removedItems?.forEach((element) {
        refundAmount += (element.originalLineItem?.unitPrice ?? 0);
      });
      addedItems?.forEach((element) {
        addedPrice += (element.lineItem?.unitPrice ?? 0);
      });

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
                        'Refund ${order.currency?.symbolNative ?? ''} ${formatter.format((refundAmount - addedPrice).toString())}',
                        style: const TextStyle(color: Colors.red),
                      )),
                ),
              ],
            ),
            space,
          ],
        );
      } else if (orderEdit.differenceDue?.isGreaterThan(0) ?? false) {
        return const SizedBox.shrink();
      } else {
        return const SizedBox.shrink();
      }
    }

    return Column(
      children: [
        payment(),
        Row(
          children: [
            const Icon(MedusaIcons.pencil_square_solid),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Edit requested', style: smallTextStyle),
                Text(
                  '${timeago.format(DateTime.now().subtract(durationDiff))} by',
                  style: smallTextStyle?.copyWith(color: lightWhite),
                ),
              ],
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
                                  title: Text(item.lineItem?.title ?? ''),
                                  subtitle: Text(
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
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: item?.thumbnail != null
                                      ? ConstrainedBox(
                                          constraints: const BoxConstraints(maxWidth: 50),
                                          child: CachedNetworkImage(imageUrl: item?.thumbnail ?? ''))
                                      : null,
                                  title: Text(item?.title ?? ''),
                                  subtitle: Text(
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
