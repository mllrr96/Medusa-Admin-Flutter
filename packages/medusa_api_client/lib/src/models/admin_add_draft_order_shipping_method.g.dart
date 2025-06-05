// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_add_draft_order_shipping_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminAddDraftOrderShippingMethodImpl
_$$AdminAddDraftOrderShippingMethodImplFromJson(Map<String, dynamic> json) =>
    _$AdminAddDraftOrderShippingMethodImpl(
      shippingOptionId: json['shipping_option_id'] as String,
      customAmount: (json['custom_amount'] as num).toDouble(),
      description: json['description'] as String,
      internalNote: json['internal_note'] as String,
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AdminAddDraftOrderShippingMethodImplToJson(
  _$AdminAddDraftOrderShippingMethodImpl instance,
) => <String, dynamic>{
  'shipping_option_id': instance.shippingOptionId,
  'custom_amount': instance.customAmount,
  'description': instance.description,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};
