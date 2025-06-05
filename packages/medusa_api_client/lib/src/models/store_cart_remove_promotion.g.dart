// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_cart_remove_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreCartRemovePromotionImpl _$$StoreCartRemovePromotionImplFromJson(
  Map<String, dynamic> json,
) => _$StoreCartRemovePromotionImpl(
  promoCodes: (json['promo_codes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$StoreCartRemovePromotionImplToJson(
  _$StoreCartRemovePromotionImpl instance,
) => <String, dynamic>{'promo_codes': instance.promoCodes};
