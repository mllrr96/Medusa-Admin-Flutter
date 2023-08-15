import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';

import '../../../components/adaptive_filled_button.dart';
import '../controllers/orders_controller.dart';

class OrdersFilterView extends StatefulWidget {
  const OrdersFilterView(
    this.context, {
    super.key,
  });
  final BuildContext? context;
  @override
  State<OrdersFilterView> createState() => _OrdersFilterViewState();
}

class _OrdersFilterViewState extends State<OrdersFilterView> {
  final controller = OrdersController.instance;
  late OrderFilter orderFilter;
  final scrollController = ScrollController();
  final statusKey = GlobalKey();
  final paymentStatusKey = GlobalKey();
  final fulfillmentStatusKey = GlobalKey();
  final regionsKey = GlobalKey();
  final salesChannelKey = GlobalKey();
  final dateKey = GlobalKey();
  @override
  void initState() {
    orderFilter = controller.orderFilter ??
        OrderFilter(status: [], paymentStatus: [], fulfillmentStatus: [], regions: [], salesChannel: []);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final bottomPadding = context.mediaQueryViewPadding.bottom == 0 ? 20.0 : context.mediaQueryViewPadding.bottom;
    const space = SizedBox(height: 12.0);
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveCloseButton(),
        title: const Text('Orders Filter'),
        actions: [
          AdaptiveButton(
            onPressed: () {
              controller.resetFilter();
              Get.back();
            },
            child: const Text('Reset'),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, bottomPadding),
        color: context.theme.appBarTheme.backgroundColor,
        child: AdaptiveFilledButton(
            onPressed: () {
              controller.updateFilter(orderFilter);
              Get.back();
            },
            child: Text('Apply', style: smallTextStyle?.copyWith(color: Colors.white))),
      ),
      body: ListView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        children: [
          CustomExpansionTile(
            key: statusKey,
            initiallyExpanded: orderFilter.status.isNotEmpty,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: statusKey);
              }
            },
            title: Text('Status', style: smallTextStyle),
            children: OrderStatus.values
                .map((e) => CheckboxListTile(
                    title: Text(e.name(), style: smallTextStyle),
                    value: orderFilter.status.contains(e),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      if (val == null) {
                        return;
                      }
                      if (val) {
                        orderFilter.status.add(e);
                      } else {
                        orderFilter.status.remove(e);
                      }
                      setState(() {});
                    }))
                .toList(),
          ),
          space,
          CustomExpansionTile(
            key: paymentStatusKey,
            initiallyExpanded: orderFilter.paymentStatus.isNotEmpty,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: paymentStatusKey);
              }
            },
            title: Text('Payment Status', style: smallTextStyle),
            children: PaymentStatus.values
                .map((e) => CheckboxListTile(
                    title: Text(e.name(), style: smallTextStyle),
                    value: orderFilter.paymentStatus.contains(e),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      if (val == null) {
                        return;
                      }
                      if (val) {
                        orderFilter.paymentStatus.add(e);
                      } else {
                        orderFilter.paymentStatus.remove(e);
                      }
                      setState(() {});
                    }))
                .toList(),
          ),
          space,
          CustomExpansionTile(
            key: fulfillmentStatusKey,
            initiallyExpanded: orderFilter.fulfillmentStatus.isNotEmpty,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: fulfillmentStatusKey);
              }
            },
            title: Text('Fulfillment Status', style: smallTextStyle),
            children: FulfillmentStatus.values
                .map((e) => CheckboxListTile(
                    title: Text(e.name(), style: smallTextStyle),
                    value: orderFilter.fulfillmentStatus.contains(e),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      if (val == null) {
                        return;
                      }
                      if (val) {
                        orderFilter.fulfillmentStatus.add(e);
                      } else {
                        orderFilter.fulfillmentStatus.remove(e);
                      }
                      setState(() {});
                    }))
                .toList(),
          ),
          space,
          CustomExpansionTile(
            key: regionsKey,
            initiallyExpanded: orderFilter.regions.isNotEmpty,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: regionsKey);
              }
            },
            title: Text('Regions', style: smallTextStyle),
          ),
          space,
          CustomExpansionTile(
            key: salesChannelKey,
            initiallyExpanded: orderFilter.salesChannel.isNotEmpty,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: salesChannelKey);
              }
            },
            title: Text('Sales Channel', style: smallTextStyle),
          ),
          space,
          CustomExpansionTile(
            key: dateKey,
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: dateKey);
              }
            },
            title: Text('Date', style: smallTextStyle),
          ),
        ],
      ),
    );
  }

  Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
    await Future.delayed(delay ?? const Duration(milliseconds: 240)).then((value) async {
      final yPosition =
          (globalKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero).dy ?? 0.0;

      var topPadding =
          context.mediaQueryPadding.top + kToolbarHeight + 26 + (widget.context?.mediaQueryPadding.top ?? 0);
      final scrollPoint = scrollController.offset + yPosition - topPadding;
      if (scrollPoint <= scrollController.position.maxScrollExtent) {
        await scrollController.animateTo(scrollPoint - 10,
            duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      } else {
        await scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      }
    });
  }
}

class OrderFilter {
  final List<OrderStatus> status;
  final List<PaymentStatus> paymentStatus;
  final List<FulfillmentStatus> fulfillmentStatus;
  final List<Region> regions;
  final List<SalesChannel> salesChannel;
  OrderFilter({
    required this.status,
    required this.paymentStatus,
    required this.fulfillmentStatus,
    required this.regions,
    required this.salesChannel,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (status.isNotEmpty) {
      for (int i = 0; i < status.length; i++) {
        data['status[$i]'] = status[i].value;
      }
    }

    if (paymentStatus.isNotEmpty) {
      for (int i = 0; i < paymentStatus.length; i++) {
        data['payment_status[$i]'] = paymentStatus[i].value;
      }
    }
    if (fulfillmentStatus.isNotEmpty) {
      for (int i = 0; i < fulfillmentStatus.length; i++) {
        data['fulfillment_status[$i]'] = fulfillmentStatus[i].value;
      }
    }

    return data;
  }

  int count() {
    int i = 0;
    if (status.isNotEmpty) {
      i += 1;
    }
    if (paymentStatus.isNotEmpty) {
      i += 1;
    }
    if (fulfillmentStatus.isNotEmpty) {
      i += 1;
    }
    if (regions.isNotEmpty) {
      i += 1;
    }
    if (salesChannel.isNotEmpty) {
      i += 1;
    }

    return i;
  }
}
