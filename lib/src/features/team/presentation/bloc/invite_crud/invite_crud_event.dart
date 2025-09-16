part of 'invite_crud_bloc.dart';

@freezed
class InviteCrudEvent with _$InviteCrudEvent {
  const factory InviteCrudEvent.loadAll() = _LoadAll;

  const factory InviteCrudEvent.resend(String id) = _Resend;

  const factory InviteCrudEvent.delete(String id) = _Delete;

  const factory InviteCrudEvent.create(String email) = _Create;

  const factory InviteCrudEvent.accept(
      InviteAcceptReq userAcceptInvitationReq) = _Accept;
}
