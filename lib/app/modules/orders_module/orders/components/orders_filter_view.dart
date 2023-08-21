import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_date_picker.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/components/date_time_card.dart';
import 'package:medusa_admin/app/modules/components/labeled_numeric_text_field.dart';
import '../../../../../core/utils/enums.dart';
import '../../../components/adaptive_filled_button.dart';

class OrdersFilterView extends StatefulWidget {
  const OrdersFilterView({
    this.context,
    this.orderFilter,
    this.onResetTap,
    this.regions,
    this.salesChannels,
    super.key,
  });
  final BuildContext? context;
  final OrderFilter? orderFilter;
  final void Function()? onResetTap;
  final List<Region>? regions;
  final List<SalesChannel>? salesChannels;
  @override
  State<OrdersFilterView> createState() => _OrdersFilterViewState();
}

class _OrdersFilterViewState extends State<OrdersFilterView> {
  late OrderFilter orderFilter;
  final scrollController = ScrollController();
  final statusKey = GlobalKey();
  final paymentStatusKey = GlobalKey();
  final fulfillmentStatusKey = GlobalKey();
  final regionsKey = GlobalKey();
  final salesChannelKey = GlobalKey();
  final dateKey = GlobalKey();
  final numberCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
    scrollController.dispose();
    numberCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final bottomPadding = context.mediaQueryViewPadding.bottom == 0
        ? 20.0
        : context.mediaQueryViewPadding.bottom;
    const space = SizedBox(height: 12.0);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: const Text('Orders Filter'),
          actions: [
            AdaptiveButton(
              onPressed: widget.onResetTap,
              child: const Text('Reset'),
            )
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, bottomPadding),
          color: context.theme.appBarTheme.backgroundColor,
          child: AdaptiveFilledButton(
              onPressed: () {
                if (orderFilter.orderDateFilter.active &&
                    !formKey.currentState!.validate()) {
                  return;
                }
                final filterType = orderFilter.orderDateFilter.dateFilterType;
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

                Get.back(result: orderFilter);
              },
              // onPressed: () {

              // },
              child: Text('Apply',
                  style: smallTextStyle?.copyWith(color: Colors.white))),
        ),
        body: Form(
          key: formKey,
          child: ListView(
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
                    await scrollToSelectedContent(
                        globalKey: fulfillmentStatusKey);
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
                children: [
                  if (widget.regions?.isNotEmpty ?? false)
                    ...widget.regions!
                        .map((e) => CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            title: Text(e.name ?? '', style: smallTextStyle),
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
                            }))
                        .toList(),
                ],
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
                children: [
                  if (widget.salesChannels?.isNotEmpty ?? false)
                    ...widget.salesChannels!
                        .map((e) => CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            title: Text(e.name ?? '', style: smallTextStyle),
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
                        .toList()
                ],
              ),
              space,
              CustomExpansionTile(
                key: dateKey,
                initiallyExpanded: orderFilter.orderDateFilter.active,
                onExpansionChanged: (expanded) async {
                  if (expanded) {
                    await scrollToSelectedContent(globalKey: dateKey);
                  }
                },
                title: Text('Date', style: smallTextStyle),
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
                children: [
                  DropdownButtonFormField<DateFilterType>(
                    value: orderFilter.orderDateFilter.dateFilterType,
                    onChanged: (type) {
                      if (type != null) {
                        setState(() {
                          orderFilter.orderDateFilter.dateFilterType = type;
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
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d*\.?\d{0,2}')),
                            ],
                            noEndSpace: false,
                            onPlusPressed: () {
                              int? stock = int.tryParse(
                                  numberCtrl.text.removeAllWhitespace);
                              if (stock != null) {
                                numberCtrl.text = (stock + 1).toString();
                              } else {
                                numberCtrl.text = 1.toString();
                              }
                              if (!orderFilter.orderDateFilter.active) {
                                setState(() {
                                  orderFilter.orderDateFilter.active = true;
                                });
                              }
                            },
                            onMinusPressed: () {
                              int? stock = int.tryParse(
                                  numberCtrl.text.removeAllWhitespace);
                              if (stock != null && stock != 1) {
                                numberCtrl.text = (stock - 1).toString();
                              }
                              if (!orderFilter.orderDateFilter.active) {
                                setState(() {
                                  orderFilter.orderDateFilter.active = true;
                                });
                              }
                            },
                            onChanged: (_) {
                              if (!orderFilter.orderDateFilter.active) {
                                setState(() {
                                  orderFilter.orderDateFilter.active = true;
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
                            value: orderFilter.orderDateFilter.dateType,
                            onChanged: (type) {
                              if (type != null) {
                                setState(() {
                                  orderFilter.orderDateFilter.dateType = type;
                                  if (!orderFilter.orderDateFilter.active) {
                                    orderFilter.orderDateFilter.active = true;
                                  }
                                });
                              }
                            },
                            items: DateType.values
                                .map((e) => DropdownMenuItem<DateType>(
                                    value: e,
                                    child: Text(e.name.capitalize ?? e.name)))
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
                          dateTime: orderFilter.orderDateFilter.date,
                          dateText: null,
                          dateTimeTextStyle: smallTextStyle,
                          onTap: () async {
                            final result = await adaptiveDateTimePicker(
                                context: context,
                                date: orderFilter.orderDateFilter.date,
                                pickerMode: CupertinoDatePickerMode.date);
                            if (result != null) {
                              setState(() {
                                orderFilter.orderDateFilter.date = result;
                              });
                            }
                          },
                        ),
                        space,
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> scrollToSelectedContent(
      {required GlobalKey globalKey, Duration? delay}) async {
    await Future.delayed(delay ?? const Duration(milliseconds: 240))
        .then((value) async {
      final yPosition =
          (globalKey.currentContext?.findRenderObject() as RenderBox?)
                  ?.localToGlobal(Offset.zero)
                  .dy ??
              0.0;

      var topPadding = context.mediaQueryPadding.top +
          kToolbarHeight +
          26 +
          (widget.context?.mediaQueryPadding.top ?? 0);
      final scrollPoint = scrollController.offset + yPosition - topPadding;
      if (scrollPoint <= scrollController.position.maxScrollExtent) {
        await scrollController.animateTo(scrollPoint - 10,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn);
      } else {
        await scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn);
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
