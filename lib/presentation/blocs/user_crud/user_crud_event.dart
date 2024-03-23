part of 'user_crud_bloc.dart';

@freezed
class UserCrudEvent with _$UserCrudEvent {
  const factory UserCrudEvent.load(String id) = _Load;
  const factory UserCrudEvent.loadAll({Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory UserCrudEvent.loadCurrentUser() = _LoadCurrentUser;
  const factory UserCrudEvent.delete(String id) = _Delete;
  const factory UserCrudEvent.requestPasswordReset(String email) = _RequestPasswordReset;
  const factory UserCrudEvent.resetPassword(UserResetPasswordReq userResetPasswordReq) = _ResetPassword;
  const factory UserCrudEvent.create(UserCreateUserReq userCreateUserReq) =
      _Create;
  const factory UserCrudEvent.update(
      String id, UserUpdateUserReq userUpdateUserReq) = _Update;
}
