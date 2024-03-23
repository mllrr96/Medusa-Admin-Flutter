part of 'user_crud_bloc.dart';

@freezed
class UserCrudState with _$UserCrudState {
  const factory UserCrudState.initial() = _Initial;
  const factory UserCrudState.loading() = _Loading;
  const factory UserCrudState.user(User user) = _User;
  const factory UserCrudState.users(List<User> users, int count) = _Users;
  const factory UserCrudState.deleted() = _Deleted;
  const factory UserCrudState.passwordResetRequested() = _PasswordResetRequested;
  const factory UserCrudState.passwordReset() = _PasswordReset;
  const factory UserCrudState.error(Failure failure) = _Error;
}
