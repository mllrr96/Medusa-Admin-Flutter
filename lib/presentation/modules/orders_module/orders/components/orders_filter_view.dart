import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/presentation/widgets/adaptive_date_picker.dart';
import 'package:medusa_admin/presentation/widgets/date_time_card.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/utils/enums.dart';
import 'orders_filter_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class OrdersFilterView extends StatefulWidget {
  const OrdersFilterView({
    this.orderFilter,
    this.onResetTap,
    this.onSubmitted,
    super.key,
  });

  final OrderFilter? orderFilter;
  final void Function()? onResetTap;
  final void Function(OrderFilter?)? onSubmitted;

  @override
  State<OrdersFilterView> createState() => _OrdersFilterViewState();
}

class _OrdersFilterViewState extends State<OrdersFilterView> {
  late OrderFilter orderFilter;
  final statusKey = GlobalKey();
  final paymentStatusKey = GlobalKey();
  final fulfillmentStatusKey = GlobalKey();
  final regionsKey = GlobalKey();
  final salesChannelKey = GlobalKey();
  final dateKey = GlobalKey();
  final numberCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = OrdersFilterController.instance;

  @override
  void initState() {
    orderFilter = widget.orderFilter ??
        OrderFilter(
            status: [],
            paymentStatus: [],
            fulfillmentStatus: [],
            regions: [],
            salesChannel: [],
            orderDateFilter: OrderDateFilter(
                number: 0,
                dateType: DateType.day,
                dateFilterType: DateFilterType.isInTheLast));

    numberCtrl.text = orderFilter.orderDateFilter.number.toString();
    super.initState();
  }

  @override
  void dispose() {
    numberCtrl.dispose();
    super.dispose();
  }

  bool isStatusOpen = false;

  final Widget disabledApplyButton = const Expanded(
    flex: 4,
    child: FilledButton(
        onPressed: null,
        child: Text('Apply')),
  );
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);

    return GestureDetector(
      onTap: () => context.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders Filter'),
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: widget.onResetTap,
                    child: const Text('Reset'),
                  ),
                ),
                const Gap(8.0),
                controller.obx(
                      (state) => Expanded(
                        flex: 4,
                        child: FilledButton(
                        onPressed: () {
                          if (orderFilter.orderDateFilter.active &&
                              !formKey.currentState!.validate()) {
                            return;
                          }
                          final filterType =
                              orderFilter.orderDateFilter.dateFilterType;
                          final dateType = orderFilter.orderDateFilter.dateType;
                          if (filterType == DateFilterType.isInTheLast ||
                              filterType == DateFilterType.isOlderThan) {
                            final count = int.tryParse(numberCtrl.text);
                            if (count != null) {
                              final now = DateTime.now();
                              DateTime date;
                              switch (dateType) {
                                case DateType.day:
                                  date = now.subtract(Duration(days: count));
                                  break;
                                case DateType.month:
                                  date = now.subtract(Duration(days: count * 30));
                                  break;
                              }
                              orderFilter.orderDateFilter.date = date;
                            }
                          }

                          orderFilter.orderDateFilter.number =
                              int.tryParse(numberCtrl.text) ?? 0;
                          widget.onSubmitted?.call(orderFilter);
                          context.popRoute();
                        },
                        child: const Text('Apply')),
                      ),
                  onLoading: disabledApplyButton,
                  onEmpty: disabledApplyButton,
                  onError: (_) => disabledApplyButton,
                ),
              ],
            )),
        body: Form(
          key: formKey,
          child: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: () async => await controller.loadData(),
            header:  const MaterialClassicHeader(),
            child: controller.obx(
              (state) {
                final regions = state?.$1;
                final salesChannels = state?.$2;
                return SingleChildScrollView(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                  child: Column(
                  children: [
                      FlexExpansionTile(
                        key: statusKey,
                        title: const Text('Status'),
                        initiallyExpanded: orderFilter.status.isNotEmpty,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await statusKey.currentContext.ensureVisibility();
                          }
                        },
                        child: Column(
                          children: OrderStatus.values
                              .map((e) => CheckboxListTile(
                                  title:
                                      Text(e.toString(), style: smallTextStyle),
                                  value: orderFilter.status.contains(e),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
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
                      ),
                      space,
                      FlexExpansionTile(
                        key: paymentStatusKey,
                        initiallyExpanded:
                            orderFilter.paymentStatus.isNotEmpty,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await paymentStatusKey.currentContext
                                .ensureVisibility();
                          }
                        },
                        title: const Text('Payment Status'),
                        child: Column(
                          children: PaymentStatus.values
                              .map((e) => CheckboxListTile(
                                  title:
                                      Text(e.toString(), style: smallTextStyle),
                                  value:
                                      orderFilter.paymentStatus.contains(e),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
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
                      ),
                      space,
                      FlexExpansionTile(
                        key: fulfillmentStatusKey,
                        initiallyExpanded:
                            orderFilter.fulfillmentStatus.isNotEmpty,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await fulfillmentStatusKey.currentContext
                                .ensureVisibility();
                          }
                        },
                        title: const Text('Fulfillment Status'),
                        child: Column(
                          children: FulfillmentStatus.values
                              .map((e) => CheckboxListTile(
                                  title:
                                      Text(e.toString(), style: smallTextStyle),
                                  value: orderFilter.fulfillmentStatus
                                      .contains(e),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
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
                      ),
                      space,
                      FlexExpansionTile(
                        key: regionsKey,
                        initiallyExpanded: orderFilter.regions.isNotEmpty,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await regionsKey.currentContext
                                .ensureVisibility();
                          }
                        },
                        title: const Text('Regions'),
                        child: Column(children: [
                          if (regions?.isNotEmpty ?? false)
                            ...regions!.map((e) => CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                title:
                                    Text(e.name ?? '', style: smallTextStyle),
                                value: orderFilter.regions
                                    .map((e) => e.id)
                                    .contains(e.id),
                                onChanged: (val) {
                                  if (val == null) {
                                    return;
                                  }

                                  if (val) {
                                    orderFilter.regions.add(e);
                                  } else {
                                    orderFilter.regions.removeWhere(
                                        (element) => element.id == e.id);
                                  }
                                  setState(() {});
                                })),
                        ]),
                      ),
                      space,
                      FlexExpansionTile(
                        key: salesChannelKey,
                        initiallyExpanded:
                            orderFilter.salesChannel.isNotEmpty,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await salesChannelKey.currentContext
                                .ensureVisibility();
                          }
                        },
                        title: const Text('Sales Channel'),
                        child: Column(children: [
                          if (salesChannels?.isNotEmpty ?? false)
                            ...salesChannels!.map((e) => CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                title:
                                    Text(e.name ?? '', style: smallTextStyle),
                                value: orderFilter.salesChannel
                                    .map((e) => e.id)
                                    .contains(e.id),
                                onChanged: (val) {
                                  if (val == null) {
                                    return;
                                  }

                                  if (val) {
                                    orderFilter.salesChannel.add(e);
                                  } else {
                                    orderFilter.salesChannel.removeWhere(
                                        (element) => element.id == e.id);
                                  }
                                  setState(() {});
                                }))
                        ]),
                      ),
                      space,
                      FlexExpansionTile(
                        key: dateKey,
                        initiallyExpanded: orderFilter.orderDateFilter.active,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await dateKey.currentContext.ensureVisibility();
                          }
                        },
                        title: const Text('Date'),
                        leading: Checkbox(
                            value: orderFilter.orderDateFilter.active,
                            onChanged: (val) {
                              if (val == null) {
                                return;
                              }
                              if (val) {
                                orderFilter.orderDateFilter.active = true;
                              } else {
                                orderFilter.orderDateFilter.active = false;
                                numberCtrl.clear();
                              }
                              setState(() {});
                            }),
                        child: Column(children: [
                          DropdownButtonFormField<DateFilterType>(
                            style: context.bodyMedium,
                            isDense: true,
                            value: orderFilter.orderDateFilter.dateFilterType,
                            onChanged: (type) {
                              if (type != null) {
                                setState(() {
                                  orderFilter.orderDateFilter.dateFilterType =
                                      type;
                                  if (!orderFilter.orderDateFilter.active) {
                                    orderFilter.orderDateFilter.active = true;
                                  }
                                });
                              }
                            },
                            items: DateFilterType.values
                                .map((e) => DropdownMenuItem<DateFilterType>(
                                    value: e, child: Text(e.name())))
                                .toList(),
                          ),
                          space,
                          if (orderFilter.orderDateFilter.dateFilterType ==
                                  DateFilterType.isInTheLast ||
                              orderFilter.orderDateFilter.dateFilterType ==
                                  DateFilterType.isOlderThan)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: LabeledNumericTextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    noEndSpace: false,
                                    onPlusPressed: () {
                                      int? stock = int.tryParse(numberCtrl
                                          .text.removeAllWhitespace);
                                      if (stock != null) {
                                        numberCtrl.text =
                                            (stock + 1).toString();
                                      } else {
                                        numberCtrl.text = 1.toString();
                                      }
                                      if (!orderFilter
                                          .orderDateFilter.active) {
                                        setState(() {
                                          orderFilter.orderDateFilter.active =
                                              true;
                                        });
                                      }
                                    },
                                    onMinusPressed: () {
                                      int? stock = int.tryParse(numberCtrl
                                          .text.removeAllWhitespace);
                                      if (stock != null && stock != 1) {
                                        numberCtrl.text =
                                            (stock - 1).toString();
                                      }
                                      if (!orderFilter
                                          .orderDateFilter.active) {
                                        setState(() {
                                          orderFilter.orderDateFilter.active =
                                              true;
                                        });
                                      }
                                    },
                                    onChanged: (_) {
                                      if (!orderFilter
                                          .orderDateFilter.active) {
                                        setState(() {
                                          orderFilter.orderDateFilter.active =
                                              true;
                                        });
                                      }
                                    },
                                    label: null,
                                    controller: numberCtrl,
                                    validator: (val) {
                                      if (val == null ||
                                          val.isEmpty ||
                                          int.tryParse(val) == 0) {
                                        return 'Field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                Flexible(
                                  child: DropdownButtonFormField<DateType>(
                                    style: context.bodyMedium,
                                    value:
                                        orderFilter.orderDateFilter.dateType,
                                    onChanged: (type) {
                                      if (type != null) {
                                        setState(() {
                                          orderFilter.orderDateFilter
                                              .dateType = type;
                                          if (!orderFilter
                                              .orderDateFilter.active) {
                                            orderFilter.orderDateFilter
                                                .active = true;
                                          }
                                        });
                                      }
                                    },
                                    items: DateType.values
                                        .map((e) => DropdownMenuItem<
                                                DateType>(
                                            value: e,
                                            child: Text(
                                                e.name.capitalize ?? e.name)))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          if (orderFilter.orderDateFilter.dateFilterType !=
                                  DateFilterType.isInTheLast &&
                              orderFilter.orderDateFilter.dateFilterType !=
                                  DateFilterType.isOlderThan)
                            Column(
                              children: [
                                DateCard(
                                  validator: (val) {
                                    if (val == null) {
                                      return 'Field is required';
                                    }
                                    return null;
                                  },
                                  dateTime: orderFilter.orderDateFilter.date,
                                  dateText: null,
                                  dateTimeTextStyle: smallTextStyle,
                                  onTap: () async {
                                    final result =
                                        await adaptiveDateTimePicker(
                                            context: context,
                                            date: orderFilter
                                                .orderDateFilter.date,
                                            pickerMode:
                                                CupertinoDatePickerMode.date);
                                    if (result != null) {
                                      setState(() {
                                        orderFilter.orderDateFilter.date =
                                            result;
                                      });
                                    }
                                  },
                                ),
                                space,
                              ],
                            ),
                        ]),
                      ),
                    ],
                  ),
                );
              },
              onLoading: const Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Skeletonizer(
                  enabled: true,
                  child: Column(
                    children: [
                      FlexExpansionTile(
                        title: Text('Status'),
                      ),
                      space,
                      FlexExpansionTile(
                        title: Text('Payment Status'),
                      ),
                      space,
                      FlexExpansionTile(
                        title: Text('Fulfillment Status'),
                      ),
                      space,
                      FlexExpansionTile(
                        title: Text('Regions'),
                      ),
                      space,
                      FlexExpansionTile(
                        title: Text('Sales Channel'),
                      ),
                      space,
                      FlexExpansionTile(
                        title: Text('Date'),
                        leading: Icon(Icons.check_box_outline_blank),
                      ),
                    ],
                  ),
                ),
              ),
              onError: (error) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Error retrieving data \n${error ?? ''}'),
                  ),
                  FilledButton(
                      onPressed: () async => await controller.loadData(),
                      child: const Text('Retry'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderFilter {
  final List<OrderStatus> status;
  final List<PaymentStatus> paymentStatus;
  final List<FulfillmentStatus> fulfillmentStatus;
  final List<Region> regions;
  final List<SalesChannel> salesChannel;
  final OrderDateFilter orderDateFilter;

  OrderFilter({
    required this.status,
    required this.paymentStatus,
    required this.fulfillmentStatus,
    required this.regions,
    required this.salesChannel,
    required this.orderDateFilter,
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

    if (regions.isNotEmpty) {
      for (int i = 0; i < regions.length; i++) {
        data['region_id[$i]'] = regions[i].id;
      }
    }
    if (salesChannel.isNotEmpty) {
      for (int i = 0; i < salesChannel.length; i++) {
        data['sales_channel_id[$i]'] = salesChannel[i].id;
      }
    }

    if (orderDateFilter.active) {
      final date = orderDateFilter.date!;
      final startDate = DateTime(date.year, date.month, date.day, 0, 0, 0);
      final nextDate = startDate.add(const Duration(days: 1));

      switch (orderDateFilter.dateFilterType) {
        case DateFilterType.isOlderThan:
          data['created_at[lt]'] = date;
        case DateFilterType.isInTheLast:
          data['created_at[gt]'] = date;
        case DateFilterType.isBefore:
          data['created_at[lte]'] = date;
        case DateFilterType.isEqualTo:
          data['created_at[gt]'] = startDate;
          data['created_at[lt]'] = nextDate;
        case DateFilterType.isAfter:
          data['created_at[gte]'] = date;
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
    if (orderDateFilter.active) {
      i += 1;
    }

    return i;
  }
}

class OrderDateFilter {
  DateTime? date;
  int number;
  DateType dateType;
  DateFilterType dateFilterType;
  bool active;

  OrderDateFilter(
      {this.date,
      required this.number,
      required this.dateType,
      required this.dateFilterType,
      this.active = false});
}
