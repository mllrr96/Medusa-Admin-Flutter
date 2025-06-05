// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_cart_shipping_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseCartShippingMethodImpl _$$BaseCartShippingMethodImplFromJson(
  Map<String, dynamic> json,
) => _$BaseCartShippingMethodImpl(
  id: json['id'] as String,
  cartId: json['cart_id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  amount: (json['amount'] as num).toDouble(),
  isTaxInclusive: json['is_tax_inclusive'] as bool,
  shippingOptionId: json['shipping_option_id'] as String,
  data: json['data'] as Map<String, dynamic>,
  metadata: json['metadata'] as Map<String, dynamic>,
  taxLines: (json['tax_lines'] as List<dynamic>)
      .map((e) => BaseShippingMethodTaxLine.fromJson(e as Map<String, dynamic>))
      .toList(),
  adjustments: (json['adjustments'] as List<dynamic>)
      .map(
        (e) => BaseShippingMethodAdjustment.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  originalTotal: (json['original_total'] as num).toDouble(),
  originalSubtotal: (json['original_subtotal'] as num).toDouble(),
  originalTaxTotal: (json['original_tax_total'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
  subtotal: (json['subtotal'] as num).toDouble(),
  taxTotal: (json['tax_total'] as num).toDouble(),
  discountTotal: (json['discount_total'] as num).toDouble(),
  discountTaxTotal: (json['discount_tax_total'] as num).toDouble(),
);

Map<String, dynamic> _$$BaseCartShippingMethodImplToJson(
  _$BaseCartShippingMethodImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'cart_id': instance.cartId,
  'name': instance.name,
  'description': instance.description,
  'amount': instance.amount,
  'is_tax_inclusive': instance.isTaxInclusive,
  'shipping_option_id': instance.shippingOptionId,
  'data': instance.data,
  'metadata': instance.metadata,
  'tax_lines': instance.taxLines,
  'adjustments': instance.adjustments,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'original_total': instance.originalTotal,
  'original_subtotal': instance.originalSubtotal,
  'original_tax_total': instance.originalTaxTotal,
  'total': instance.total,
  'subtotal': instance.subtotal,
  'tax_total': instance.taxTotal,
  'discount_total': instance.discountTotal,
  'discount_tax_total': instance.discountTaxTotal,
};
