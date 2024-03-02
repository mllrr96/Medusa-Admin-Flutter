part of 'api_key_crud_bloc.dart';

@freezed
class ApiKeyCrudEvent with _$ApiKeyCrudEvent {
  const factory ApiKeyCrudEvent.load(String id) = _Load;
  const factory ApiKeyCrudEvent.delete(String id) = _Delete;
  const factory ApiKeyCrudEvent.create(String title) = _Create;
  const factory ApiKeyCrudEvent.update(String id, String title) = _Update;
  const factory ApiKeyCrudEvent.revoke(String id) = _Revoke;
  const factory ApiKeyCrudEvent.addSalesChannels(
      String id, List<String> salesChannelsIds) = _AddSalesChannels;
  const factory ApiKeyCrudEvent.removeSalesChannels(
      String id, List<String> salesChannelsIds) = _RemoveSalesChannels;
  const factory ApiKeyCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory ApiKeyCrudEvent.loadAllSalesChannels(String id,
      {Map<String, dynamic>? queryParameters}) = _LoadAllSalesChannels;
}
