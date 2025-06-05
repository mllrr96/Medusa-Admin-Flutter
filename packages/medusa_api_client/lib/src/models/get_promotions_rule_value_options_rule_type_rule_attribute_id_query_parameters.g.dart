// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_promotions_rule_value_options_rule_type_rule_attribute_id_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParametersImpl
_$$GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParametersImplFromJson(
  Map<String, dynamic> json,
) => _$GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParametersImpl(
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  order: json['order'] as String,
  promotionType: $enumDecode(
    _$PromotionTypeEnumEnumMap,
    json['promotion_type'],
  ),
  applicationMethodType: $enumDecode(
    _$ApplicationMethodTypeEnumEnumMap,
    json['application_method_type'],
  ),
);

Map<String, dynamic>
_$$GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParametersImplToJson(
  _$GetPromotionsRuleValueOptionsRuleTypeRuleAttributeIdQueryParametersImpl
  instance,
) => <String, dynamic>{
  'offset': instance.offset,
  'limit': instance.limit,
  'order': instance.order,
  'promotion_type': instance.promotionType,
  'application_method_type': instance.applicationMethodType,
};

const _$PromotionTypeEnumEnumMap = {
  PromotionTypeEnum.standard: 'standard',
  PromotionTypeEnum.buyget: 'buyget',
};

const _$ApplicationMethodTypeEnumEnumMap = {
  ApplicationMethodTypeEnum.fixed: 'fixed',
  ApplicationMethodTypeEnum.percentage: 'percentage',
};
