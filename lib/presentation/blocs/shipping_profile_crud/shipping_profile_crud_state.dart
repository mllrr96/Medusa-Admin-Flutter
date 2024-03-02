part of 'shipping_profile_crud_bloc.dart';

@freezed
class ShippingProfileCrudState with _$ShippingProfileCrudState {
  const factory ShippingProfileCrudState.initial() = _Initial;
  const factory ShippingProfileCrudState.loading() = _Loading;
  const factory ShippingProfileCrudState.shippingProfile(
      ShippingProfile shippingProfile) = _ShippingProfile;
  const factory ShippingProfileCrudState.shippingProfiles(
      List<ShippingProfile> shippingProfiles, int count) = _ShippingProfiles;
  const factory ShippingProfileCrudState.deleted() = _Deleted;
  const factory ShippingProfileCrudState.error(Failure failure) = _Error;
}
