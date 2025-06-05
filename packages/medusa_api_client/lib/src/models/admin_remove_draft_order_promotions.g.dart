// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_remove_draft_order_promotions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminRemoveDraftOrderPromotionsImpl
_$$AdminRemoveDraftOrderPromotionsImplFromJson(Map<String, dynamic> json) =>
    _$AdminRemoveDraftOrderPromotionsImpl(
      promoCodes: (json['promo_codes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AdminRemoveDraftOrderPromotionsImplToJson(
  _$AdminRemoveDraftOrderPromotionsImpl instance,
) => <String, dynamic>{'promo_codes': instance.promoCodes};
