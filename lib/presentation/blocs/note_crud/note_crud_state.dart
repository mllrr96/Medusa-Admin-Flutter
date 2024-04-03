part of 'note_crud_bloc.dart';

@freezed
class NoteCrudState with _$NoteCrudState {
  const factory NoteCrudState.initial() = _Initial;
  const factory NoteCrudState.loading() = _Loading;
  const factory NoteCrudState.note(Note note) = _Note;
  const factory NoteCrudState.notes(List<Note> notes, int count) = _Notes;
  const factory NoteCrudState.error(Failure failure) = _Error;
  const factory NoteCrudState.deleted() = _Deleted;
}
