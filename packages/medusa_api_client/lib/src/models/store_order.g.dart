// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreOrderImpl _$$StoreOrderImplFromJson(
  Map<String, dynamic> json,
) => _$StoreOrderImpl(
  id: json['id'] as String,
  regionId: json['region_id'] as String,
  customerId: json['customer_id'] as String,
  salesChannelId: json['sales_channel_id'] as String,
  email: json['email'] as String,
  currencyCode: json['currency_code'] as String,
  displayId: (json['display_id'] as num).toDouble(),
  shippingAddress: StoreOrderAddress.fromJson(
    json['shipping_address'] as Map<String, dynamic>,
  ),
  billingAddress: StoreOrderAddress.fromJson(
    json['billing_address'] as Map<String, dynamic>,
  ),
  items: (json['items'] as List<dynamic>)
      .map((e) => StoreOrderLineItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  shippingMethods: (json['shipping_methods'] as List<dynamic>)
      .map((e) => StoreOrderShippingMethod.fromJson(e as Map<String, dynamic>))
      .toList(),
  paymentCollections: (json['payment_collections'] as List<dynamic>)
      .map((e) => StorePaymentCollection.fromJson(e as Map<String, dynamic>))
      .toList(),
  paymentStatus: $enumDecode(_$NullEnumEnumMap, json['payment_status']),
  fulfillments: (json['fulfillments'] as List<dynamic>)
      .map((e) => StoreOrderFulfillment.fromJson(e as Map<String, dynamic>))
      .toList(),
  fulfillmentStatus: $enumDecode(_$NullEnumEnumMap, json['fulfillment_status']),
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
  customer: StoreCustomer.fromJson(json['customer'] as Map<String, dynamic>),
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => BaseOrderTransaction.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String,
);

Map<String, dynamic> _$$StoreOrderImplToJson(_$StoreOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region_id': instance.regionId,
      'customer_id': instance.customerId,
      'sales_channel_id': instance.salesChannelId,
      'email': instance.email,
      'currency_code': instance.currencyCode,
      'display_id': instance.displayId,
      'shipping_address': instance.shippingAddress,
      'billing_address': instance.billingAddress,
      'items': instance.items,
      'shipping_methods': instance.shippingMethods,
      'payment_collections': instance.paymentCollections,
      'payment_status': instance.paymentStatus,
      'fulfillments': instance.fulfillments,
      'fulfillment_status': instance.fulfillmentStatus,
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
      'customer': instance.customer,
      'transactions': instance.transactions,
      'status': instance.status,
    };

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
