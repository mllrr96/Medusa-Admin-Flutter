part of 'shipping_profiles_bloc.dart';

@freezed
class ShippingProfilesEvent with _$ShippingProfilesEvent {
  const factory ShippingProfilesEvent.load({Map<String, dynamic>? queryParameters}) = _Load;

  const factory ShippingProfilesEvent.create(CreateShippingProfileReq payload) = _Create;

  const factory ShippingProfilesEvent.retrieve(String id) = _Retrieve;

  const factory ShippingProfilesEvent.update(String id, UpdateShippingProfileReq payload) = _Update;

  const factory ShippingProfilesEvent.delete(String id) = _Delete;
}
