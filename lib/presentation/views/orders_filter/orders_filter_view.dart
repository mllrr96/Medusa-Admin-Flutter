import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/data/models/orders_filter.dart';
import 'package:medusa_admin/presentation/blocs/orders_filter/orders_filter_bloc.dart';
import 'package:medusa_admin/presentation/widgets/date_time_card.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/utils/enums.dart';
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

  final Widget disabledApplyButton = const Expanded(
    flex: 4,
    child: FilledButton(onPressed: null, child: Text('Apply')),
  );

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
                padding: EdgeInsets.fromLTRB(12, 0, 12, context.bottomViewPadding != 0 ? context.bottomViewPadding : 12),
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
                    state.maybeMap(
                        loaded: (state) => Expanded(
                              flex: 4,
                              child: FilledButton(
                                  onPressed: () {
                                    if (orderFilter.orderDateFilter.active &&
                                        !formKey.currentState!.validate()) {
                                      return;
                                    }
                                    final filterType = orderFilter
                                        .orderDateFilter.dateFilterType;
                                    final dateType =
                                        orderFilter.orderDateFilter.dateType;
                                    if (filterType ==
                                            DateFilterType.isInTheLast ||
                                        filterType ==
                                            DateFilterType.isOlderThan) {
                                      final count =
                                          int.tryParse(numberCtrl.text);
                                      if (count != null) {
                                        final now = DateTime.now();
                                        DateTime date;
                                        switch (dateType) {
                                          case DateType.day:
                                            date = now.subtract(
                                                Duration(days: count));
                                            break;
                                          case DateType.month:
                                            date = now.subtract(
                                                Duration(days: count * 30));
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
                child: state.map(
                  initial: (_) => const SizedBox.shrink(),
                  loading: (_) => const Padding(
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
                  loaded: (_) {
                    final regions = _.regions;
                    final salesChannels = _.salesChannels;
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 10),
                      child: Column(
                        children: [
                          FlexExpansionTile(
                            key: statusKey,
                            title: const Text('Status'),
                            initiallyExpanded: orderFilter.status.isNotEmpty,
                            onExpansionChanged: (expanded) async {
                              if (expanded) {
                                await statusKey.currentContext
                                    .ensureVisibility();
                              }
                            },
                            child: Column(
                              children: OrderStatus.values
                                  .map((e) => CheckboxListTile(
                                      title: Text(e.toString(),
                                          style: smallTextStyle),
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
                                      title: Text(e.toString(),
                                          style: smallTextStyle),
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
                                      title: Text(e.toString(),
                                          style: smallTextStyle),
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
                                          orderFilter.fulfillmentStatus
                                              .remove(e);
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
                              if (regions.isNotEmpty)
                                ...regions.map((e) => CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(e.name ?? '',
                                        style: smallTextStyle),
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
                              if (salesChannels.isNotEmpty)
                                ...salesChannels.map((e) => CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(e.name ?? '',
                                        style: smallTextStyle),
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
                            initiallyExpanded:
                                orderFilter.orderDateFilter.active,
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
                                value:
                                    orderFilter.orderDateFilter.dateFilterType,
                                onChanged: (type) {
                                  if (type != null) {
                                    setState(() {
                                      orderFilter.orderDateFilter
                                          .dateFilterType = type;
                                      if (!orderFilter.orderDateFilter.active) {
                                        orderFilter.orderDateFilter.active =
                                            true;
                                      }
                                    });
                                  }
                                },
                                items: DateFilterType.values
                                    .map((e) =>
                                        DropdownMenuItem<DateFilterType>(
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
                                      child: DropdownButtonFormField<DateType>(
                                        style: context.bodyMedium,
                                        value: orderFilter
                                            .orderDateFilter.dateType,
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
                                            .map((e) =>
                                                DropdownMenuItem<DateType>(
                                                    value: e,
                                                    child: Text(
                                                        e.name.capitalize)))
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
                                      dateTime:
                                          orderFilter.orderDateFilter.date,
                                      dateText: null,
                                      dateTimeTextStyle: smallTextStyle,
                                      onTap: () async {
                                        final result =
                                            await context.adaptiveDateTimePicker(
                                                date:
                                                    orderFilter
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
                            ]),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (error) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                            'Error retrieving data \n${error.failure.toString()}'),
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
