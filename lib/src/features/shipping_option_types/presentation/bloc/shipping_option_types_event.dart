part of 'shipping_option_types_bloc.dart';

@freezed
class ShippingOptionTypesEvent with _$ShippingOptionTypesEvent {
  const factory ShippingOptionTypesEvent.load(Map<String, dynamic>? query) = _Load;
  const factory ShippingOptionTypesEvent.create(CreateShippingOptionTypeReq payload) = _Create;
  const factory ShippingOptionTypesEvent.retrieve(String id) = _Retrieve;
  const factory ShippingOptionTypesEvent.update(String id, UpdateShippingOptionTypeReq payload) = _Update;
  const factory ShippingOptionTypesEvent.delete(String id) = _Delete;
}
