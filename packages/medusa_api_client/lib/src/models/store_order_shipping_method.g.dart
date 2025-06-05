// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_order_shipping_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreOrderShippingMethodImpl _$$StoreOrderShippingMethodImplFromJson(
  Map<String, dynamic> json,
) => _$StoreOrderShippingMethodImpl(
  id: json['id'] as String,
  orderId: json['order_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  amount: (json['amount'] as num).toDouble(),
  isTaxInclusive: json['is_tax_inclusive'] as bool,
  shippingOptionId: json['shipping_option_id'] as String,
  data: json['data'] as Map<String, dynamic>,
  metadata: json['metadata'] as Map<String, dynamic>,
  taxLines: json['tax_lines'] as List<dynamic>,
  adjustments: json['adjustments'] as List<dynamic>,
  originalTotal: (json['original_total'] as num).toDouble(),
  originalSubtotal: (json['original_subtotal'] as num).toDouble(),
  originalTaxTotal: (json['original_tax_total'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
  subtotal: (json['subtotal'] as num).toDouble(),
  taxTotal: (json['tax_total'] as num).toDouble(),
  discountTotal: (json['discount_total'] as num).toDouble(),
  discountTaxTotal: (json['discount_tax_total'] as num).toDouble(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  detail: json['detail'],
);

Map<String, dynamic> _$$StoreOrderShippingMethodImplToJson(
  _$StoreOrderShippingMethodImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'order_id': instance.orderId,
  'name': instance.name,
  'description': instance.description,
  'amount': instance.amount,
  'is_tax_inclusive': instance.isTaxInclusive,
  'shipping_option_id': instance.shippingOptionId,
  'data': instance.data,
  'metadata': instance.metadata,
  'tax_lines': instance.taxLines,
  'adjustments': instance.adjustments,
  'original_total': instance.originalTotal,
  'original_subtotal': instance.originalSubtotal,
  'original_tax_total': instance.originalTaxTotal,
  'total': instance.total,
  'subtotal': instance.subtotal,
  'tax_total': instance.taxTotal,
  'discount_total': instance.discountTotal,
  'discount_tax_total': instance.discountTaxTotal,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'detail': instance.detail,
};
