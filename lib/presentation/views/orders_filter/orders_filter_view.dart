import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/models/orders_filter.dart';
import 'package:medusa_admin/presentation/blocs/orders_filter/orders_filter_bloc.dart';
import 'package:medusa_admin/presentation/widgets/date_time_card.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
  final refreshController = RefreshController();

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

  final Widget disabledApplyButton = const ShadButton.ghost(
      size: ShadButtonSize.lg, onPressed: null, child: Text('Apply'));

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    return BlocConsumer<OrdersFilterBloc, OrdersFilterState>(
      listener: (context, state) {
        state.mapOrNull(
          loaded: (state) => refreshController.refreshCompleted(),
          error: (error) => refreshController.refreshFailed(),
        );
      },
      builder: (context, state) {
        return HideKeyboard(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Orders Filter'),
            ),
            bottomNavigationBar: Container(
                padding: EdgeInsets.fromLTRB(
                    12,
                    0,
                    12,
                    context.bottomViewPadding != 0
                        ? context.bottomViewPadding
                        : 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ShadButton.secondary(
                      size: ShadButtonSize.lg,
                      onPressed: widget.onResetTap,
                      child: const Text('Reset'),
                    ),
                    const Gap(8.0),
                    state.maybeMap(
                        loaded: (state) => ShadButton(
                            size: ShadButtonSize.lg,
                            onPressed: () {
                              if (orderFilter.orderDateFilter.active &&
                                  !formKey.currentState!.validate()) {
                                return;
                              }
                              final filterType =
                                  orderFilter.orderDateFilter.dateFilterType;
                              final dateType =
                                  orderFilter.orderDateFilter.dateType;
                              if (filterType == DateFilterType.isInTheLast ||
                                  filterType == DateFilterType.isOlderThan) {
                                final count = int.tryParse(numberCtrl.text);
                                if (count != null) {
                                  final now = DateTime.now();
                                  DateTime date;
                                  switch (dateType) {
                                    case DateType.day:
                                      date =
                                          now.subtract(Duration(days: count));
                                      break;
                                    case DateType.month:
                                      date = now
                                          .subtract(Duration(days: count * 30));
                                      break;
                                  }
                                  orderFilter.orderDateFilter.date = date;
                                }
                              }

                              orderFilter.orderDateFilter.number =
                                  int.tryParse(numberCtrl.text) ?? 0;
                              widget.onSubmitted?.call(orderFilter);
                              context.maybePop();
                            },
                            child: const Text('Apply')),
                        orElse: () => disabledApplyButton),
                  ],
                )),
            body: Form(
              key: formKey,
              child: SmartRefresher(
                controller: refreshController,
                onRefresh: () => context
                    .read<OrdersFilterBloc>()
                    .add(const OrdersFilterEvent.loadFilters()),
                child: state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                    child: Skeletonizer(
                      enabled: true,
                      child: ShadAccordion<int>.multiple(
                          maintainState: true,
                          children: [
                            ShadAccordionItem(
                              value: 1,
                              title: Text('Status'),
                              child: SizedBox.shrink(),
                            ),
                            ShadAccordionItem(
                              value: 2,
                              title: Text('Payment Status'),
                              child: SizedBox.shrink(),
                            ),
                            ShadAccordionItem(
                              value: 3,
                              title: Text('Fulfillment Status'),
                              child: SizedBox.shrink(),
                            ),
                            ShadAccordionItem(
                              value: 4,
                              title: Text('Regions'),
                              child: SizedBox.shrink(),
                            ),
                            ShadAccordionItem(
                              value: 5,
                              title: Text('Sales Channel'),
                              child: SizedBox.shrink(),
                            ),
                            ShadAccordionItem(
                              value: 6,
                              title: Text('Date'),
                              child: SizedBox.shrink(),
                            ),
                          ]),
                    ),
                  ),
                  loaded: (regions, salesChannels) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 10),
                      child: ShadAccordion<int>.multiple(
                        maintainState: true,
                        children: [
                          ShadAccordionItem(
                            value: 1,
                            title: const Text('Status'),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: OrderStatus.values
                                  .map((e) => ShadCheckbox(
                                      label: Text(e.toString()),
                                      value: orderFilter.status.contains(e),
                                      onChanged: (val) {
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
                          ShadAccordionItem(
                            value: 2,
                            title: const Text('Payment Status'),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: PaymentStatus.values
                                  .map((e) => ShadCheckbox(
                                      label: Text(e.toString()),
                                      value:
                                          orderFilter.paymentStatus.contains(e),
                                      onChanged: (val) {
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
                          ShadAccordionItem(
                            value: 3,
                            title: const Text('Fulfillment Status'),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: FulfillmentStatus.values
                                  .map((e) => ShadCheckbox(
                                      // size: 30,
                                      label: Text(e.toString()),
                                      value: orderFilter.fulfillmentStatus
                                          .contains(e),
                                      onChanged: (val) {
                                        if (val) {
                                          orderFilter.fulfillmentStatus.add(e);
                                        } else {
                                          orderFilter.fulfillmentStatus
                                              .remove(e);
                                        }
                                        setState(() {});
                                      }))
                                  .toList(),
                            ),
                          ),
                          ShadAccordionItem(
                            value: 4,
                            title: const Text('Regions'),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (regions.isNotEmpty)
                                    ...regions.map((e) => ShadCheckbox(
                                        label: Text(e.name ?? ''),
                                        value: orderFilter.regions
                                            .map((e) => e.id)
                                            .contains(e.id),
                                        onChanged: (val) {
                                          if (val) {
                                            orderFilter.regions.add(e);
                                          } else {
                                            orderFilter.regions.removeWhere(
                                                (element) =>
                                                    element.id == e.id);
                                          }
                                          setState(() {});
                                        })),
                                ]),
                          ),
                          ShadAccordionItem(
                            value: 5,
                            title: const Text('Sales Channel'),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (salesChannels.isNotEmpty)
                                    ...salesChannels.map((e) => ShadCheckbox(
                                        label: Text(e.name ?? ''),
                                        value: orderFilter.salesChannel
                                            .map((e) => e.id)
                                            .contains(e.id),
                                        onChanged: (val) {
                                          if (val) {
                                            orderFilter.salesChannel.add(e);
                                          } else {
                                            orderFilter.salesChannel
                                                .removeWhere((element) =>
                                                    element.id == e.id);
                                          }
                                          setState(() {});
                                        }))
                                ]),
                          ),
                          ShadAccordionItem(
                            value: 6,
                            title: const Text('Date'),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShadSelect<DateFilterType>(
                                      initialValue: orderFilter
                                          .orderDateFilter.dateFilterType,
                                      onChanged: (type) {
                                        if (type ==null){
                                          return;
                                        }
                                        setState(() {
                                          orderFilter.orderDateFilter
                                              .dateFilterType = type;
                                          if (!orderFilter
                                              .orderDateFilter.active) {
                                            orderFilter.orderDateFilter.active =
                                                true;
                                          }
                                        });
                                      },
                                      options: DateFilterType.values
                                          .map((e) =>
                                              ShadOption<DateFilterType>(
                                                  value: e,
                                                  child: Text(e.name())))
                                          .toList(),
                                      selectedOptionBuilder: (context, value) {
                                        return Text(value.name());
                                      },
                                    ),
                                    ShadCheckbox(
                                        value:
                                            orderFilter.orderDateFilter.active,
                                        onChanged: (val) {
                                          if (val) {
                                            orderFilter.orderDateFilter.active =
                                                true;
                                          } else {
                                            orderFilter.orderDateFilter.active =
                                                false;
                                            numberCtrl.clear();
                                          }
                                          setState(() {});
                                        })
                                  ],
                                ),
                                space,
                                if (orderFilter
                                            .orderDateFilter.dateFilterType ==
                                        DateFilterType.isInTheLast ||
                                    orderFilter
                                            .orderDateFilter.dateFilterType ==
                                        DateFilterType.isOlderThan)
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: LabeledNumericTextField(
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
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
                                                orderFilter.orderDateFilter
                                                    .active = true;
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
                                                orderFilter.orderDateFilter
                                                    .active = true;
                                              });
                                            }
                                          },
                                          onChanged: (_) {
                                            if (!orderFilter
                                                .orderDateFilter.active) {
                                              setState(() {
                                                orderFilter.orderDateFilter
                                                    .active = true;
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
                                        child: ShadSelect<DateType>(
                                          initialValue: orderFilter
                                              .orderDateFilter.dateType,
                                          onChanged: (type) {
                                            if (type ==null){
                                              return;
                                            }
                                            setState(() {
                                              orderFilter.orderDateFilter
                                                  .dateType = type;
                                              if (!orderFilter
                                                  .orderDateFilter.active) {
                                                orderFilter.orderDateFilter
                                                    .active = true;
                                              }
                                            });
                                          },
                                          options: DateType.values
                                              .map((e) => ShadOption<DateType>(
                                                  value: e,
                                                  child:
                                                      Text(e.name.capitalize)))
                                              .toList(),
                                          selectedOptionBuilder:
                                              (context, value) {
                                            return Text(value.name.capitalize);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                if (orderFilter
                                            .orderDateFilter.dateFilterType !=
                                        DateFilterType.isInTheLast &&
                                    orderFilter
                                            .orderDateFilter.dateFilterType !=
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
                                        dateTime:
                                            orderFilter.orderDateFilter.date,
                                        dateText: null,
                                        dateTimeTextStyle: smallTextStyle,
                                        onTap: () async {
                                          final result = await context
                                              .adaptiveDateTimePicker(
                                                  date: orderFilter
                                                      .orderDateFilter.date,
                                                  pickerMode:
                                                      CupertinoDatePickerMode
                                                          .date);
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (failure) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                            'Error retrieving data \n${failure.toString()}'),
                      ),
                      FilledButton(
                          onPressed: () => context
                              .read<OrdersFilterBloc>()
                              .add(const OrdersFilterEvent.loadFilters()),
                          child: const Text('Retry'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
