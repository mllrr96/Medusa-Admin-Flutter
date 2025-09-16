part of 'campaign_crud_bloc.dart';

@freezed
class CampaignCrudEvent with _$CampaignCrudEvent {
  const factory CampaignCrudEvent.load(String id) = _Load;

  const factory CampaignCrudEvent.loadAll({
    Map<String, dynamic>? queryParameters,
  }) = _LoadAll;

  const factory CampaignCrudEvent.create(CreateCampaignReq payload) = _Create;

  const factory CampaignCrudEvent.update(String id, UpdateCampaignReq payload) = _Update;

  const factory CampaignCrudEvent.delete(String id) = _Delete;
}
