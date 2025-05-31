// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_promotions_rule_attribute_options_rule_type_query_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters
_$GetPromotionsRuleAttributeOptionsRuleTypeQueryParametersFromJson(
  Map<String, dynamic> json,
) => _GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters(
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
_$GetPromotionsRuleAttributeOptionsRuleTypeQueryParametersToJson(
  _GetPromotionsRuleAttributeOptionsRuleTypeQueryParameters instance,
) => <String, dynamic>{
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
