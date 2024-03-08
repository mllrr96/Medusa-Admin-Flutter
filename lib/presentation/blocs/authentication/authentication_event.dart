part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.init() = _Init;
  const factory AuthenticationEvent.logInJWT(String email, String password) = _LogInJWT;
  const factory AuthenticationEvent.logInCookie(String email, String password) = _LogInCookie;
  const factory AuthenticationEvent.logInToken() = _LogInToken;
  const factory AuthenticationEvent.logOut() = _LogOut;
  const factory AuthenticationEvent.cancel() = _Cancel;
}
