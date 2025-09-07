part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  const factory AuthenticationState.loading() = _Loading;
  const factory AuthenticationState.loggedIn(User user) = _LoggedIn;
  const factory AuthenticationState.loggedOut() = _LoggedOut;
  const factory AuthenticationState.error(MedusaError error) = _Error;
}
