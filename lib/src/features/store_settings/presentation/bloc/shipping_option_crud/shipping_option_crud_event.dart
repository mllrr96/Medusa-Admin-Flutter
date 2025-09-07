part of 'shipping_option_crud_bloc.dart';

@freezed
class ShippingOptionCrudEvent with _$ShippingOptionCrudEvent {
  const factory ShippingOptionCrudEvent.load(String id) = _Load;
  const factory ShippingOptionCrudEvent.delete(String id) = _Delete;
  const factory ShippingOptionCrudEvent.create(
      CreateShippingOptionReq userCreateShippingOptionReq) = _Create;
  const factory ShippingOptionCrudEvent.update(
          String id, UpdateShippingOptionReq userUpdateShippingOptionReq) =
      _Update;
  const factory ShippingOptionCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
}
