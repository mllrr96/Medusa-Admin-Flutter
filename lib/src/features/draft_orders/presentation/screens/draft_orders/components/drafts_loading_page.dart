import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'draft_order_card.dart';

class DraftsLoadingPage extends StatelessWidget {
  const DraftsLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final draftOrder = DraftOrder(
      id: '1',
      displayId: 1,
      status: 'open',
      paymentCollections: [],
      items: [],
      shippingMethods: [],
      currencyCode: '',
      version: 0,
      regionId: '',
      customerId: '',
      salesChannelId: '',
      email: '',
      paymentStatus:PaymentStatus.canceled,
      fulfillmentStatus: FulfillmentStatus.delivered,
      summary: OrderSummary(paidTotal: 0,
          refundedTotal: 0,
          pendingDifference: 0,
          currentOrderTotal: 0,
          originalOrderTotal: 0,
          transactionTotal: 0,
          accountingTotal: 0),
      originalItemTotal: 0,
      originalItemSubtotal: 0,
      originalItemTaxTotal: 0,
      itemTotal: 0,
      itemSubtotal: 0,
      itemTaxTotal: 0,
      originalTotal: 0,
      originalSubtotal: 0,
      originalTaxTotal: 0,
      total: 0,
      subtotal: 0,
      taxTotal: 0,
      discountTotal: 0,
      discountTaxTotal: 0,
      giftCardTotal: 0,
      giftCardTaxTotal: 0,
      shippingTotal: 0,
      shippingSubtotal: 0,
      shippingTaxTotal: 0,
      originalShippingTotal: 0,
      originalShippingSubtotal: 0,
      originalShippingTaxTotal: 0,
      creditLineTotal: 0,
    );
    return Skeletonizer(
      enabled: true,
      child: Column(
          children: List.generate(
              20,
                  (index) =>
              index.isEven
                  ? DraftOrderCard(draftOrder, shimmer: true)
                  : const Gap(12.0))),
    );
  }
}
