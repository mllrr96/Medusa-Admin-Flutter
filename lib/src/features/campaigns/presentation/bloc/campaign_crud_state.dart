part of 'campaign_crud_bloc.dart';

@freezed
class CampaignCrudState with _$CampaignCrudState {
  const factory CampaignCrudState.initial() = _Initial;
  const factory CampaignCrudState.loading() = _Loading;
  const factory CampaignCrudState.campaign(Campaign campaign) = _Campaign;
  const factory CampaignCrudState.campaigns(List<Campaign> campaigns, int count) = _Campaigns;
  const factory CampaignCrudState.error(MedusaError error) = _Error;
  const factory CampaignCrudState.deleted() = _Deleted;
}
