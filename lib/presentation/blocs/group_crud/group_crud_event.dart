part of 'group_crud_bloc.dart';

@freezed
class GroupCrudEvent with _$GroupCrudEvent {
  const factory GroupCrudEvent.load(String id) = _Load;
  const factory GroupCrudEvent.loadAll({Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory GroupCrudEvent.delete(String id) = _Delete;
  const factory GroupCrudEvent.create(
      String name, Map<String, dynamic>? metadata) = _Create;
  const factory GroupCrudEvent.update(
      String id, String name, Map<String, dynamic>? metadata) = _Update;
  const factory GroupCrudEvent.addCustomers(
      String id, List<String> customerIds) = _AddCustomers;
  const factory GroupCrudEvent.removeCustomers(
      String id, List<String> customerIds) = _RemoveCustomers;
}
