part of 'region_crud_bloc.dart';

@freezed
class RegionCrudEvent with _$RegionCrudEvent {
  // CRUD
  const factory RegionCrudEvent.load(String id) = _Load;
  const factory RegionCrudEvent.create(
      UserCreateRegionReq userCreateRegionReq) = _Create;
  const factory RegionCrudEvent.update(
      String id, UserUpdateRegionReq userUpdateRegionReq) = _Update;
  const factory RegionCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory RegionCrudEvent.delete(String id) = _Delete;
  //
  const factory RegionCrudEvent.addCountry(String id, String countryCode) = _AddCountry;
  const factory RegionCrudEvent.removeCountry(String id, String countryCode) = _RemoveCountry;
  const factory RegionCrudEvent.loadFulfillmentOptions(String id) = _LoadFulfillmentOptions;
  const factory RegionCrudEvent.addFulfillmentProvider(String id, String providerId) = _AddFulfillmentProvider;
  const factory RegionCrudEvent.removeFulfillmentProvider(String id, String providerId) = _RemoveFulfillmentProvider;
  const factory RegionCrudEvent.addPaymentProvider(String id, String providerId) = _AddPaymentProvider;
  const factory RegionCrudEvent.removePaymentProvider(String id, String providerId) = _RemovePaymentProvider;
}
