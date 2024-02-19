part of 'sales_channels_cubit.dart';

@freezed
class SalesChannelsState with _$SalesChannelsState {
  const factory SalesChannelsState.initial() = _Initial;
  const factory SalesChannelsState.loading() = _Loading;
  const factory SalesChannelsState.salesChannels(List<SalesChannel> salesChannels, int count) = _SalesChannels;
  const factory SalesChannelsState.error(Failure error) = _Error;
}
