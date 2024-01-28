
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

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