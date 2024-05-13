import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/di/medusa_admin_di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/domain/use_case/auth/auth_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
    AuthPreferenceService authPreferenceService,
    AuthenticationUseCase authenticationUseCase,
    FlutterSecureStorage flutterSecureStorage,
  )   : _authPreferenceService = authPreferenceService,
        _authenticationUseCase = authenticationUseCase,
        _flutterSecureStorage = flutterSecureStorage,
        super(const _Initial()) {
    on<_Init>(_onInit);
    on<_LogInCookie>(_onLoginCookie);
    on<_LogInJWT>(_onLoginJWT);
    on<_LogInToken>(_onLoginToken);
    on<_LogOut>(_logOut);
    on<_Cancel>(_cancel);

    add(const _Init());
  }

  Future<void> _onInit(
    _Init event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const _Loading());
    await MedusaAdminDi.registerMedusaAdminSingleton();

    // in case baseUrl is not set or not authenticated (no jwt/cookie/token stored) then go to login page
    if (_authPreferenceService.baseUrl == null ||
        !_authPreferenceService.isAuthenticated) {
      // without the delay BlocListener in splash view will be created with the
      // state loggedOut so it won't navigate to login page since there's no change in the state
      // this is a bug in flutter_bloc
      await Future.delayed(500.milliseconds)
          .then((value) => emit(const _LoggedOut()));
    } else {
      final result = await _authenticationUseCase.getCurrentUser();
      result.when(
          (user) => emit(_LoggedIn(user)), (error) => emit(_Error(error)));
    }
  }

  Future<void> _onLoginCookie(
    _LogInCookie event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const _Loading());
    if (!await InternetConnection().hasInternetAccess) {
      emit(_Error(Failure(message: AppConstants.noInternetMessage, type: '')));
      return;
    }

    final result = await _authenticationUseCase.loginCookie(
        email: event.email, password: event.password);
    result.when((cookie) async {
      await _flutterSecureStorage.write(
          key: AppConstants.cookieKey, value: cookie);
      _authPreferenceService.setIsAuthenticated(true);
      _authPreferenceService.setEmail(event.email);
      final userResult = await _authenticationUseCase.getCurrentUser();
      userResult.when((user) => emit(_LoggedIn(user)), (e) => emit(_Error(e)));
    }, (e) => emit(_Error(e)));
  }

  Future<void> _onLoginJWT(
    _LogInJWT event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const _Loading());
    if (!await InternetConnection().hasInternetAccess) {
      emit(_Error(Failure(message: AppConstants.noInternetMessage, type: '')));
      return;
    }
    final result = await _authenticationUseCase.loginJWT(
        email: event.email, password: event.password);
    await result.when((jwt) async {
      await _flutterSecureStorage.write(key: AppConstants.jwtKey, value: jwt);
      _authPreferenceService.setIsAuthenticated(true);
      _authPreferenceService.setEmail(event.email);
      final userResult = await _authenticationUseCase.getCurrentUser();
      userResult.when((user) => emit(_LoggedIn(user)), (e) => emit(_Error(e)));
    }, (e) {
      emit(_Error(e));
    });
  }

  Future<void> _onLoginToken(
    _LogInToken event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const _Loading());
    if (!await InternetConnection().hasInternetAccess) {
      emit(_Error(Failure(message: AppConstants.noInternetMessage, type: '')));
      return;
    }
    final result = await _authenticationUseCase.getCurrentUser();

    result.when((user) {
      _authPreferenceService.setIsAuthenticated(true);
      emit(_LoggedIn(user));
    }, (e) => emit(_Error(e)));
  }

  Future<void> _logOut(
    _LogOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const _Loading());
    if (!await InternetConnection().hasInternetAccess) {
      emit(_Error(Failure(message: AppConstants.noInternetMessage, type: '')));
      return;
    }
    final result = await _authenticationUseCase.logout();
    result.when((success) {
      _authPreferenceService.setIsAuthenticated(false);
      emit(const _LoggedOut());
    }, (e) => emit(_Error(e)));
  }

  Future<void> _cancel(
    _Cancel event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const _Loading());
    emit(const _Initial());
  }

  final AuthPreferenceService _authPreferenceService;
  final AuthenticationUseCase _authenticationUseCase;
  final FlutterSecureStorage _flutterSecureStorage;
  static AuthenticationBloc get instance => getIt<AuthenticationBloc>();
}
