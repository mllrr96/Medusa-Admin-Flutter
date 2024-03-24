import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/personal_info/personal_info_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'user_crud_event.dart';
part 'user_crud_state.dart';
part 'user_crud_bloc.freezed.dart';

@injectable
class UserCrudBloc extends Bloc<UserCrudEvent, UserCrudState> {
  UserCrudBloc(PersonalInfoCrudUseCase personalInfoCrudUseCase)
      : _useCase = personalInfoCrudUseCase,
        super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadCurrentUser>(_loadCurrentUser);
    on<_LoadAll>(_loadAll);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Delete>(_delete);
    on<_ResetPassword>(_resetPassword);
    on<_RequestPasswordReset>(_requestPasswordReset);
  }

  Future<void> _load(_Load event, Emitter<UserCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.currentUser();
    result.when(
      (user) => emit(_User(user)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _loadCurrentUser(
      _LoadCurrentUser event, Emitter<UserCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.currentUser();
    result.when(
      (user) => emit(_User(user)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _loadAll(_LoadAll event, Emitter<UserCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.fetchUsers();
    result.when(
      (response) => emit(_Users(response.userList ?? [], response.count ?? 0)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _create(_Create event, Emitter<UserCrudState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.createUser(payload: event.userCreateUserReq);
    result.when(
      (user) => emit(_User(user)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _delete(_Delete event, Emitter<UserCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.delete(event.id);
    result.when(
      (success) => emit(const _Deleted()),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _update(_Update event, Emitter<UserCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.updateUser(
      id: event.id,
      payload: event.userUpdateUserReq,
    );
    result.when(
      (user) => emit(_User(user)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _resetPassword(
      _ResetPassword event, Emitter<UserCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.resetPassword(
      payload: event.userResetPasswordReq,
    );
    result.when(
      (user) => emit(_User(user)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _requestPasswordReset(
      _RequestPasswordReset event, Emitter<UserCrudState> emit) async {
    emit(const _Loading());
    final result = await _useCase.requestPasswordReset(email: event.email);
    result.when(
      (success) => emit(const _PasswordResetRequested()),
      (error) => emit(_Error(error)),
    );
  }

  final PersonalInfoCrudUseCase _useCase;
  static int pageSize = 20;
  static UserCrudBloc get instance => getIt<UserCrudBloc>();
}
