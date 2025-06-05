// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_draft_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminDraftOrderImpl _$$AdminDraftOrderImplFromJson(
  Map<String, dynamic> json,
) => _$AdminDraftOrderImpl(
  paymentCollections: (json['payment_collections'] as List<dynamic>)
      .map((e) => AdminPaymentCollection.fromJson(e as Map<String, dynamic>))
      .toList(),
  fulfillments: (json['fulfillments'] as List<dynamic>)
      .map((e) => AdminOrderFulfillment.fromJson(e as Map<String, dynamic>))
      .toList(),
  salesChannel: AdminSalesChannel.fromJson(
    json['sales_channel'] as Map<String, dynamic>,
  ),
  customer: AdminCustomer.fromJson(json['customer'] as Map<String, dynamic>),
  shippingAddress: AdminOrderAddress.fromJson(
    json['shipping_address'] as Map<String, dynamic>,
  ),
  billingAddress: AdminOrderAddress.fromJson(
    json['billing_address'] as Map<String, dynamic>,
  ),
  items: (json['items'] as List<dynamic>)
      .map((e) => AdminOrderLineItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  shippingMethods: (json['shipping_methods'] as List<dynamic>)
      .map((e) => AdminOrderShippingMethod.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String,
  currencyCode: json['currency_code'] as String,
  id: json['id'] as String,
  version: (json['version'] as num).toDouble(),
  regionId: json['region_id'] as String,
  customerId: json['customer_id'] as String,
  salesChannelId: json['sales_channel_id'] as String,
  email: json['email'] as String,
  displayId: (json['display_id'] as num).toDouble(),
  paymentStatus: $enumDecode(_$NullEnumEnumMap, json['payment_status']),
  fulfillmentStatus: $enumDecode(_$NullEnumEnumMap, json['fulfillment_status']),
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => BaseOrderTransaction.fromJson(e as Map<String, dynamic>))
      .toList(),
  summary: BaseOrderSummary.fromJson(json['summary'] as Map<String, dynamic>),
  metadata: json['metadata'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  originalItemTotal: (json['original_item_total'] as num).toDouble(),
  originalItemSubtotal: (json['original_item_subtotal'] as num).toDouble(),
  originalItemTaxTotal: (json['original_item_tax_total'] as num).toDouble(),
  itemTotal: (json['item_total'] as num).toDouble(),
  itemSubtotal: (json['item_subtotal'] as num).toDouble(),
  itemTaxTotal: (json['item_tax_total'] as num).toDouble(),
  originalTotal: (json['original_total'] as num).toDouble(),
  originalSubtotal: (json['original_subtotal'] as num).toDouble(),
  originalTaxTotal: (json['original_tax_total'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
  subtotal: (json['subtotal'] as num).toDouble(),
  taxTotal: (json['tax_total'] as num).toDouble(),
  discountTotal: (json['discount_total'] as num).toDouble(),
  discountTaxTotal: (json['discount_tax_total'] as num).toDouble(),
  giftCardTotal: (json['gift_card_total'] as num).toDouble(),
  giftCardTaxTotal: (json['gift_card_tax_total'] as num).toDouble(),
  shippingTotal: (json['shipping_total'] as num).toDouble(),
  shippingSubtotal: (json['shipping_subtotal'] as num).toDouble(),
  shippingTaxTotal: (json['shipping_tax_total'] as num).toDouble(),
  originalShippingTotal: (json['original_shipping_total'] as num).toDouble(),
  originalShippingSubtotal: (json['original_shipping_subtotal'] as num)
      .toDouble(),
  originalShippingTaxTotal: (json['original_shipping_tax_total'] as num)
      .toDouble(),
  region: AdminRegion.fromJson(json['region'] as Map<String, dynamic>),
  creditLines: (json['credit_lines'] as List<dynamic>)
      .map((e) => OrderCreditLine.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AdminDraftOrderImplToJson(
  _$AdminDraftOrderImpl instance,
) => <String, dynamic>{
  'payment_collections': instance.paymentCollections,
  'fulfillments': instance.fulfillments,
  'sales_channel': instance.salesChannel,
  'customer': instance.customer,
  'shipping_address': instance.shippingAddress,
  'billing_address': instance.billingAddress,
  'items': instance.items,
  'shipping_methods': instance.shippingMethods,
  'status': instance.status,
  'currency_code': instance.currencyCode,
  'id': instance.id,
  'version': instance.version,
  'region_id': instance.regionId,
  'customer_id': instance.customerId,
  'sales_channel_id': instance.salesChannelId,
  'email': instance.email,
  'display_id': instance.displayId,
  'payment_status': instance.paymentStatus,
  'fulfillment_status': instance.fulfillmentStatus,
  'transactions': instance.transactions,
  'summary': instance.summary,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'original_item_total': instance.originalItemTotal,
  'original_item_subtotal': instance.originalItemSubtotal,
  'original_item_tax_total': instance.originalItemTaxTotal,
  'item_total': instance.itemTotal,
  'item_subtotal': instance.itemSubtotal,
  'item_tax_total': instance.itemTaxTotal,
  'original_total': instance.originalTotal,
  'original_subtotal': instance.originalSubtotal,
  'original_tax_total': instance.originalTaxTotal,
  'total': instance.total,
  'subtotal': instance.subtotal,
  'tax_total': instance.taxTotal,
  'discount_total': instance.discountTotal,
  'discount_tax_total': instance.discountTaxTotal,
  'gift_card_total': instance.giftCardTotal,
  'gift_card_tax_total': instance.giftCardTaxTotal,
  'shipping_total': instance.shippingTotal,
  'shipping_subtotal': instance.shippingSubtotal,
  'shipping_tax_total': instance.shippingTaxTotal,
  'original_shipping_total': instance.originalShippingTotal,
  'original_shipping_subtotal': instance.originalShippingSubtotal,
  'original_shipping_tax_total': instance.originalShippingTaxTotal,
  'region': instance.region,
  'credit_lines': instance.creditLines,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
