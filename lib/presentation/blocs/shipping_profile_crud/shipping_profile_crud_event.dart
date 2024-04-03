part of 'shipping_profile_crud_bloc.dart';

@freezed
class ShippingProfileCrudEvent with _$ShippingProfileCrudEvent {
  const factory ShippingProfileCrudEvent.load(String id) = _Load;
  const factory ShippingProfileCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory ShippingProfileCrudEvent.delete(String id) = _Delete;
  const factory ShippingProfileCrudEvent.create(
      CreateShippingProfileReq userCreateShippingProfileReq) = _Create;
  const factory ShippingProfileCrudEvent.update(String id,
      UpdateShippingProfileReq userUpdateShippingProfileReq) = _Update;
}
