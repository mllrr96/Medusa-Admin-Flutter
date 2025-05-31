// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_cart_add_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreCartAddPromotion _$StoreCartAddPromotionFromJson(
  Map<String, dynamic> json,
) => _StoreCartAddPromotion(
  promoCodes: (json['promo_codes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$StoreCartAddPromotionToJson(
  _StoreCartAddPromotion instance,
) => <String, dynamic>{'promo_codes': instance.promoCodes};
