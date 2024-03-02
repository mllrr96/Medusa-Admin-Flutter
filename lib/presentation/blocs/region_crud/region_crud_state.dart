part of 'region_crud_bloc.dart';

@freezed
class RegionCrudState with _$RegionCrudState {
  const factory RegionCrudState.initial() = _Initial;
  const factory RegionCrudState.loading() = _Loading;
  const factory RegionCrudState.region(Region region) = _Region;
  const factory RegionCrudState.regions(List<Region> regions, int count) = _Regions;
  const factory RegionCrudState.fulfillmentOptions(List<FulfillmentOption> fulfillmentOptions) = _FulfillmentOptions;
  const factory RegionCrudState.deleted() = _Deleted;
  const factory RegionCrudState.error(Failure failure) = _Error;
}
