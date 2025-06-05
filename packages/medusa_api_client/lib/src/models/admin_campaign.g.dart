// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCampaignImpl _$$AdminCampaignImplFromJson(Map<String, dynamic> json) =>
    _$AdminCampaignImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      currency: json['currency'] as String,
      campaignIdentifier: json['campaign_identifier'] as String,
      startsAt: json['starts_at'] as String,
      endsAt: json['ends_at'] as String,
      budget: json['budget'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$$AdminCampaignImplToJson(_$AdminCampaignImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'currency': instance.currency,
      'campaign_identifier': instance.campaignIdentifier,
      'starts_at': instance.startsAt,
      'ends_at': instance.endsAt,
      'budget': instance.budget,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt.toIso8601String(),
    };
