part of 'region_crud_bloc.dart';

@freezed
class RegionCrudEvent with _$RegionCrudEvent {
  const factory RegionCrudEvent.load(String id) = _Load;
  const factory RegionCrudEvent.create(
      UserCreateRegionReq userCreateRegionReq) = _Create;
  const factory RegionCrudEvent.update(
      String id, UserUpdateRegionReq userUpdateRegionReq) = _Update;
  const factory RegionCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory RegionCrudEvent.delete(String id) = _Delete;
}
