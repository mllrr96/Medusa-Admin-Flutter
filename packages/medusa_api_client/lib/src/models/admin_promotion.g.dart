// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPromotionImpl _$$AdminPromotionImplFromJson(Map<String, dynamic> json) =>
    _$AdminPromotionImpl(
      applicationMethod: AdminApplicationMethod.fromJson(
        json['application_method'] as Map<String, dynamic>,
      ),
      rules: (json['rules'] as List<dynamic>)
          .map((e) => AdminPromotionRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      code: json['code'] as String,
      type: $enumDecode(_$NullEnumEnumMap, json['type']),
      isAutomatic: json['is_automatic'] as bool,
      campaignId: json['campaign_id'] as String,
      campaign: AdminCampaign.fromJson(
        json['campaign'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
      status: $enumDecode(_$NullEnumEnumMap, json['status']),
    );

Map<String, dynamic> _$$AdminPromotionImplToJson(
  _$AdminPromotionImpl instance,
) => <String, dynamic>{
  'application_method': instance.applicationMethod,
  'rules': instance.rules,
  'id': instance.id,
  'code': instance.code,
  'type': instance.type,
  'is_automatic': instance.isAutomatic,
  'campaign_id': instance.campaignId,
  'campaign': instance.campaign,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt.toIso8601String(),
  'status': instance.status,
};

const _$NullEnumEnumMap = {
  NullEnum.secret: 'secret',
  NullEnum.publishable: 'publishable',
};
