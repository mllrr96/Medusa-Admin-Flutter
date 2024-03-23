part of 'api_key_crud_bloc.dart';

@freezed
class ApiKeyCrudState with _$ApiKeyCrudState {
  const factory ApiKeyCrudState.initial() = _Initial;
  const factory ApiKeyCrudState.loading() = _Loading;
  const factory ApiKeyCrudState.apiKey(PublishableApiKey apiKey) = _ApiKey;
  const factory ApiKeyCrudState.apiKeys(List<PublishableApiKey> apiKeys, int count) = _ApiKeys;
  const factory ApiKeyCrudState.deleted() = _Deleted;
  const factory ApiKeyCrudState.error(Failure failure) = _Error;
  const factory ApiKeyCrudState.apiKeySalesChannels(List<SalesChannel> salesChannels, int count) = _ApiKeySalesChannels;

}
