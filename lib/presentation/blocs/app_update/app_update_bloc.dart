import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/data/models/app_update.dart';
import 'package:medusa_admin/domain/use_case/app_update/check_update_use_case.dart';

part 'app_update_event.dart';
part 'app_update_state.dart';
part 'app_update_bloc.freezed.dart';

@injectable
class AppUpdateBloc extends Bloc<AppUpdateEvent, AppUpdateState> {
  AppUpdateBloc(this.checkUpdateUseCase) : super(const _Initial()) {
    on<_CheckForUpdate>(_checkForUpdate);
    on<_PerformUpdate>(_performUpdate);
  }

  Future<void> _checkForUpdate(
    _CheckForUpdate event,
    Emitter<AppUpdateState> emit,
  ) async {
    emit(const _Loading());
    final result = await checkUpdateUseCase();
    result.when((appUpdate) {
      if (appUpdate != null) {
        emit(_UpdateAvailable(appUpdate));
      } else {
        emit(const _NoUpdateAvailable());
      }
    }, (error) => emit(_Error(error)));
  }

  Future<void> _performUpdate(
    _PerformUpdate event,
    Emitter<AppUpdateState> emit,
  ) async {}

  final CheckUpdateUseCase checkUpdateUseCase;
  static AppUpdateBloc get instance => getIt<AppUpdateBloc>();
}
