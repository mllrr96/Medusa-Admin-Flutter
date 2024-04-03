part of 'sales_channel_crud_bloc.dart';

@freezed
class SalesChannelCrudState with _$SalesChannelCrudState {
  const factory SalesChannelCrudState.initial() = _Initial;
  const factory SalesChannelCrudState.loading() = _Loading;
  const factory SalesChannelCrudState.salesChannel(SalesChannel salesChannel) =
      _SalesChannel;
  const factory SalesChannelCrudState.salesChannels(
      List<SalesChannel> salesChannels, int count) = _SalesChannels;
  const factory SalesChannelCrudState.error(Failure failure) = _Error;
  const factory SalesChannelCrudState.deleted() = _Deleted;
}
