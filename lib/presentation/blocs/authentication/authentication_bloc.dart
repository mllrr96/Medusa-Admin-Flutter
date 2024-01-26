import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/di/medusa_admin_di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/domain/use_case/auth/auth_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart' as medusa;

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
    this.authPreferenceService,
    this.authenticationUseCase,
    this.flutterSecureStorage,
  ) : super(const _Initial()) {
    on<_Init>(_onInit);
    on<_LogInCookie>(_onLoginCookie);
    on<_LogInJWT>(_onLoginJWT);
    on<_LogInToken>(_onLoginToken);
    on<_LogOut>(_logOut);
    add(const _Init());
  }

  Future<void> _onInit(
    _Init event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const _Loading());
    await MedusaAdminDi.registerMedusaAdminSingleton();

    // in case baseUrl is not set or not authenticated (no jwt/cookie/token stored) then go to login page
    if (authPreferenceService.baseUrl == null ||
        !authPreferenceService.isAuthenticated) {
      // without the delay BlocListener in splash view will be created with the
      // state loggedOut so it won't navigate to login page since there's no change in the state
      // this is a bug in flutter_bloc
      await Future.delayed(500.milliseconds)
          .then((value) => emit(const _LoggedOut()));
    } else {
      final result = await authenticationUseCase.getCurrentUser();
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

    final result = await authenticationUseCase.loginCookie(
        email: event.email, password: event.password);
    result.when((cookie) async {
      await flutterSecureStorage.write(
          key: AppConstants.cookieKey, value: cookie);
      authPreferenceService.setIsAuthenticated(true);
      authPreferenceService.setEmail(event.email);
      final userResult = await authenticationUseCase.getCurrentUser();
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
    final result = await authenticationUseCase.loginJWT(
        email: event.email, password: event.password);
    await result.when((jwt) async {
      await flutterSecureStorage.write(key: AppConstants.jwtKey, value: jwt);
      authPreferenceService.setIsAuthenticated(true);
      authPreferenceService.setEmail(event.email);
      final userResult = await authenticationUseCase.getCurrentUser();
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
    final result = await authenticationUseCase.getCurrentUser();

    result.when((user) {
      authPreferenceService.setIsAuthenticated(true);
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
    final result = await authenticationUseCase.logout();
    result.when((success) {
      authPreferenceService.setIsAuthenticated(false);
      emit(const _LoggedOut());
    }, (e) => emit(_Error(e)));
  }

  final AuthPreferenceService authPreferenceService;
  final AuthenticationUseCase authenticationUseCase;
  final FlutterSecureStorage flutterSecureStorage;
  static AuthenticationBloc get instance => getIt<AuthenticationBloc>();
  static medusa.MedusaAdmin get medusaAdmin => getIt<medusa.MedusaAdmin>();
}
