import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/notification/notification_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(NotificationUseCase notificationUseCase)
      : _useCase = notificationUseCase,
        super(const _Initial()) {
    on<_Resend>(_resend);
    on<_LoadAll>(_loadAll);
  }

  void _resend(_Resend event, Emitter<NotificationState> emit) async {
    emit(const _Loading());
    final result = await _useCase.resend(event.id, event.to);
    result.when((notification) => emit(_Notification(notification)),
        (error) => emit(_Error(error)));
  }

  void _loadAll(_LoadAll event, Emitter<NotificationState> emit) async {
    emit(const _Loading());
    final result =
        await _useCase.loadAll(queryParameters: event.queryParameters);
    result.when(
        (response) => emit(
            _Notifications(response.notifications ?? [], response.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  final NotificationUseCase _useCase;
  static NotificationBloc get instance => getIt<NotificationBloc>();
}
