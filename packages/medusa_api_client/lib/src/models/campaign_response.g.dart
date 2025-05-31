// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampaignResponse _$CampaignResponseFromJson(Map<String, dynamic> json) =>
    _CampaignResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      currency: json['currency'] as String,
      campaignIdentifier: json['campaign_identifier'] as String,
      startsAt: json['starts_at'] as String,
      endsAt: json['ends_at'] as String,
      budget: json['budget'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CampaignResponseToJson(_CampaignResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'currency': instance.currency,
      'campaign_identifier': instance.campaignIdentifier,
      'starts_at': instance.startsAt,
      'ends_at': instance.endsAt,
      'budget': instance.budget,
    };
