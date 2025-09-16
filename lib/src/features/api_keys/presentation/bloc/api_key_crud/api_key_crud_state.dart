part of 'api_key_crud_bloc.dart';

@freezed
class ApiKeyCrudState with _$ApiKeyCrudState {
  const factory ApiKeyCrudState.initial() = _Initial;
  const factory ApiKeyCrudState.loading() = _Loading;
  const factory ApiKeyCrudState.apiKey(ApiKey apiKey) = _ApiKey;
  const factory ApiKeyCrudState.apiKeys(List<ApiKey> apiKeys, int count) =
      _ApiKeys;
  const factory ApiKeyCrudState.deleted() = _Deleted;
  const factory ApiKeyCrudState.error(MedusaError failure) = _Error;
  const factory ApiKeyCrudState.apiKeySalesChannels(
      List<SalesChannel> salesChannels, int count) = _ApiKeySalesChannels;
}
