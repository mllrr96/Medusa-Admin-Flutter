part of 'note_crud_bloc.dart';

@freezed
class NoteCrudEvent with _$NoteCrudEvent {
  const factory NoteCrudEvent.load(String id) = _Load;
  const factory NoteCrudEvent.delete(String id) = _Delete;
  const factory NoteCrudEvent.create(
    String resourceId,
    String resourceType,
    String value,
  ) = _Create;
  const factory NoteCrudEvent.update(String id, String value) = _Update;
  const factory NoteCrudEvent.loadAll({Map<String, dynamic>? queryParameters}) =
      _LoadAll;
}
