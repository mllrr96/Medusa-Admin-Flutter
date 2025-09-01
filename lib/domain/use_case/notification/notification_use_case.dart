import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class NotificationUseCase {
  NotificationRepository get _notificationRepository =>
      getIt<MedusaAdmin>().notificationRepository;

  static NotificationUseCase get instance => getIt<NotificationUseCase>();

  Future<Result<Notification, MedusaError>> resend(String id, String? to) async {
    try {
      final result = await _notificationRepository.resendNotifications(
          id: id, to: to ?? '');
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<RetrieveNotificationsRes, MedusaError>> loadAll({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _notificationRepository.retrieveNotifications(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
