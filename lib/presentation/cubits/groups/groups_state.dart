part of 'groups_cubit.dart';

@freezed
class GroupsState with _$GroupsState {
  const factory GroupsState.initial() = _Initial;
  const factory GroupsState.loading() = _Loading;
  const factory GroupsState.groups(List<CustomerGroup> groups, int count) = _Groups;
  const factory GroupsState.error(Failure failure) = _Error;
}
