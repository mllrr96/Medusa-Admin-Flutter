// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_add_draft_order_promotions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminAddDraftOrderPromotionsImpl _$$AdminAddDraftOrderPromotionsImplFromJson(
  Map<String, dynamic> json,
) => _$AdminAddDraftOrderPromotionsImpl(
  promoCodes: (json['promo_codes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$AdminAddDraftOrderPromotionsImplToJson(
  _$AdminAddDraftOrderPromotionsImpl instance,
) => <String, dynamic>{'promo_codes': instance.promoCodes};
