// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_update_draft_order_shipping_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUpdateDraftOrderShippingMethod
_$AdminUpdateDraftOrderShippingMethodFromJson(Map<String, dynamic> json) =>
    _AdminUpdateDraftOrderShippingMethod(
      shippingOptionId: json['shipping_option_id'] as String,
      customAmount: (json['custom_amount'] as num).toDouble(),
      internalNote: json['internal_note'] as String,
    );

Map<String, dynamic> _$AdminUpdateDraftOrderShippingMethodToJson(
  _AdminUpdateDraftOrderShippingMethod instance,
) => <String, dynamic>{
  'shipping_option_id': instance.shippingOptionId,
  'custom_amount': instance.customAmount,
  'internal_note': instance.internalNote,
};
