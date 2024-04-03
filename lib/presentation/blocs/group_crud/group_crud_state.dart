part of 'group_crud_bloc.dart';

@freezed
class GroupCrudState with _$GroupCrudState {
  const factory GroupCrudState.initial() = _Initial;
  const factory GroupCrudState.loading() = _Loading;
  const factory GroupCrudState.group(CustomerGroup group) = _Group;
  const factory GroupCrudState.groups(List<CustomerGroup> groups, int count) = _Groups;
  const factory GroupCrudState.deleted() = _Deleted;
  const factory GroupCrudState.error(Failure failure) = _Error;
}
