// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_cart_add_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreCartAddPromotionImpl _$$StoreCartAddPromotionImplFromJson(
  Map<String, dynamic> json,
) => _$StoreCartAddPromotionImpl(
  promoCodes: (json['promo_codes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$StoreCartAddPromotionImplToJson(
  _$StoreCartAddPromotionImpl instance,
) => <String, dynamic>{'promo_codes': instance.promoCodes};
