import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:medusa_admin/src/core/constants/strings.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/auth/data/service/auth_preference_service.dart';
import 'package:medusa_admin/src/features/auth/domain/usecases/auth/auth_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

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
    on<_Cancel>(_cancel);

    add(const _Init());
  }

  Future<void> _onInit(
    _Init event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const _Loading());
    // await MedusaAdminDi.registerMedusaAdminSingleton();

    // in case baseUrl is not set or not authenticated (no jwt/cookie/token stored) then go to login page
    // if (authPreferenceService.baseUrl == null
    //     // || !authPreferenceService.isAuthenticated
    //     ) {
    //   // without the delay BlocListener in splash view will be created with the
    //   // state loggedOut so it won't navigate to login page since there's no change in the state
    //   // this is a bug in flutter_bloc
    //   await Future.delayed(500.milliseconds).then((value) => emit(const _LoggedOut()));
    // } else {
    final token = await flutterSecureStorage.read(key: AppConstants.jwtKey);
    log('TOKEN IS $token');
    if (token == null) {
      emit(const _LoggedOut());
      return;
    }
    final result = await authenticationUseCase.postSession(token);
    log('Session user : ${result.tryGetSuccess() != null ? 'OK' : 'ERROR'}');
    final userResult = await authenticationUseCase.getCurrentUser();
    log('Current user : ${userResult.tryGetSuccess() != null ? 'OK' : 'ERROR'}');
    if (userResult.isError() || result.isError()) {
      authPreferenceService.setIsAuthenticated(false);
      emit(const _LoggedOut());
      return;
    }
    authPreferenceService.setIsAuthenticated(true);
    result.when((user) => emit(_LoggedIn(userResult.tryGetSuccess()!)),
        (error) => emit(_Error(error)));
    // }
  }

  Future<void> _onLoginCookie(
    _LogInCookie event,
    Emitter<AuthenticationState> emit,
  ) async {
    throw UnimplementedError();
    emit(const _Loading());
    if (!await InternetConnection().hasInternetAccess) {
      final e = MedusaError(
          code: '',
          type: 'Network error',
          message: AppConstants.noInternetMessage);
      emit(_Error(e));
      return;
    }

    final result = await authenticationUseCase.login(
        email: event.email, password: event.password);
    result.when((token) async {
      await flutterSecureStorage.write(
          key: AppConstants.cookieKey, value: token);
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
      final e = MedusaError(
          code: '',
          type: 'Network error',
          message: AppConstants.noInternetMessage);
      emit(_Error(e));
      return;
    }
    final result = await authenticationUseCase.login(
        email: event.email, password: event.password);

    await result.when((token) async {
      await flutterSecureStorage.write(key: AppConstants.jwtKey, value: token);
      final sessionUser = await authenticationUseCase.postSession(token);
      sessionUser.when((user) => log('Session user : ${user.actorId}'),
          (error) => log('Session error : ${error.message}'));
      final user = await authenticationUseCase.getCurrentUser();
      user.when((user) {
        authPreferenceService.setIsAuthenticated(true);
        authPreferenceService.setEmail(event.email);
        emit(_LoggedIn(user));
      }, (e) => emit(_Error(e)));
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
      final e = MedusaError(
          code: '',
          type: 'Network error',
          message: AppConstants.noInternetMessage);
      emit(_Error(e));
      return;
    }
    throw UnimplementedError();
    // final result = await authenticationUseCase.getCurrentUser(token);
    // result.when((user) {
    //   authPreferenceService.setIsAuthenticated(true);
    //   emit(_LoggedIn(user));
    // }, (e) => emit(_Error(e)));
  }

  Future<void> _logOut(
    _LogOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const _Loading());
    if (!await InternetConnection().hasInternetAccess) {
      final e = MedusaError(
          code: '',
          type: 'Network error',
          message: AppConstants.noInternetMessage);
      emit(_Error(e));
      return;
    }
    final result = await authenticationUseCase.logout();
    result.when((success) {
      authPreferenceService.setIsAuthenticated(false);
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

  final AuthPreferenceService authPreferenceService;
  final AuthenticationUseCase authenticationUseCase;
  final FlutterSecureStorage flutterSecureStorage;

  static AuthenticationBloc get instance => getIt<AuthenticationBloc>();
}
