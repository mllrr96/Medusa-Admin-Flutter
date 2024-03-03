part of 'invite_crud_bloc.dart';

@freezed
class InviteCrudState with _$InviteCrudState {
  const factory InviteCrudState.initial() = _Initial;
  const factory InviteCrudState.loading() = _Loading;
  const factory InviteCrudState.created() = _Created;
  const factory InviteCrudState.deleted() = _Deleted;
  const factory InviteCrudState.resent() = _Resent;
  const factory InviteCrudState.accepted() = _Accepted;
  const factory InviteCrudState.error(Failure failure) = _Error;
  const factory InviteCrudState.invites(List<Invite> invites) = _Invites;
}
