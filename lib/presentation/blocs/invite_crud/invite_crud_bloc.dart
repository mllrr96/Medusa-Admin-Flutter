import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/team/team_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'invite_crud_event.dart';
part 'invite_crud_state.dart';
part 'invite_crud_bloc.freezed.dart';

@injectable
class InviteCrudBloc extends Bloc<InviteCrudEvent, InviteCrudState> {
  InviteCrudBloc(InviteCrudUseCase inviteCrudUseCase)
      : _useCase = inviteCrudUseCase,
        super(const _Initial()) {
    on<_LoadAll>(_loadAll);
    on<_Delete>(_delete);
    on<_Create>(_create);
    on<_Resend>(_resend);
    on<_Accept>(_accept);
  }

  Future<void> _loadAll(_LoadAll event, Emitter<InviteCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.fetchInvites();
    result.when(
      (success) {
        emit(_Invites(success.invites!));
      },
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _delete(_Delete event, Emitter<InviteCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.deleteInvite(event.id);
    result.when(
      (success) {
        emit(const _Deleted());
      },
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _create(_Create event, Emitter<InviteCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.inviteUser(email: event.email, role: event.role);
    result.when(
      (success) {
        emit(const _Created());
      },
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _resend(_Resend event, Emitter<InviteCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.resendInvite(event.id);
    result.when(
      (success) {
        emit(const _Resent());
      },
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _accept(_Accept event, Emitter<InviteCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.acceptInvite(event.userAcceptInvitationReq);
    result.when(
      (success) {
        emit(const _Accepted());
      },
      (error) => emit(_Error(error)),
    );
  }

  final InviteCrudUseCase _useCase;
  static int pageSize = 20;
  static InviteCrudBloc get instance => getIt<InviteCrudBloc>();
}
