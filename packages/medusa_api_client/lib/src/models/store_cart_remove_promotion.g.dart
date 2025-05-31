// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_cart_remove_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreCartRemovePromotion _$StoreCartRemovePromotionFromJson(
  Map<String, dynamic> json,
) => _StoreCartRemovePromotion(
  promoCodes: (json['promo_codes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$StoreCartRemovePromotionToJson(
  _StoreCartRemovePromotion instance,
) => <String, dynamic>{'promo_codes': instance.promoCodes};
