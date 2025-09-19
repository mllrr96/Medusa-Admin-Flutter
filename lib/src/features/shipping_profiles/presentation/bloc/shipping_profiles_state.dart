part of 'shipping_profiles_bloc.dart';

@freezed
class ShippingProfilesState with _$ShippingProfilesState {
  const factory ShippingProfilesState.initial() = _Initial;
  const factory ShippingProfilesState.loading() = _Loading;
  const factory ShippingProfilesState.profiles(ShippingProfileListRes profiles) = _Profiles;
  const factory ShippingProfilesState.profile(ShippingProfile profile) = _Profile;
  const factory ShippingProfilesState.deleted() = _Deleted;
  const factory ShippingProfilesState.error(MedusaError error) = _Error;
}
